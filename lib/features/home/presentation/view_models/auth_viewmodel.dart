import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel());

class AuthViewModel extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  UserModel? get currentUser => _currentUser;

  AuthViewModel() {
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('currentUser');
    if (userData != null) {
      final userMap = jsonDecode(userData);
      _currentUser = UserModel.fromJson(userMap);

      final int? expiry = prefs.getInt('expiry');
      if (expiry != null && DateTime.now().millisecondsSinceEpoch < expiry) {
        _isAuthenticated = true;
      } else {
        await logout(); //remove token and user when token expire
      }
    }
    notifyListeners();
  }

  //login process
  Future<bool> login(String username, String password) async {
    const adminUsername = 'admin';
    const adminPassword = 'admin123';

    if (username == adminUsername && password == adminPassword) {
      final prefs = await SharedPreferences.getInstance();

      // create token with 1h
      final token = base64Encode(utf8.encode(DateTime.now().toIso8601String()));
      final expiry =
          DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch;

      _currentUser = UserModel(username: username, token: token);

      // save user information and token to SharedPreferences
      prefs.setString('currentUser', jsonEncode(_currentUser!.toJson()));
      prefs.setInt('expiry', expiry);

      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Kiểm tra token hết hạn
  Future<bool> get isTokenExpired async {
    final prefs = await SharedPreferences.getInstance();
    final expiry = prefs.getInt('expiry');
    if (expiry == null) return true;
    return DateTime.now().millisecondsSinceEpoch >= expiry;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
  }
}
