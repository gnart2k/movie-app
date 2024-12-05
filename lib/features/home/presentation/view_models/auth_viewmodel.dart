import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movie_app/features/home/data/models/user.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewmodel>((ref) => AuthViewmodel());

class AuthViewmodel extends ChangeNotifier{
UserModel? _currentUser;
bool _isAuthenticated = false;

bool get isAuthenticated => _isAuthenticated;
UserModel? get currentUser => _currentUser;

AuthViewmodel(){
  _checkAuthentication();
}
//check state login
  Future<void> _checkAuthentication() async{
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('currentUser');

    if(userData != null){
      final userMap = jsonDecode(userData);
      final user = UserModel.fromJson(userMap);

      _currentUser = user;

      final int? expiry = prefs.getInt('expiry');
      if(expiry != null && DateTime.now().millisecondsSinceEpoch < expiry){
        _isAuthenticated = true;
      }else{
        await logout();
      }
    }
    notifyListeners();
  }

  //login process
  Future<bool> login(String username, String password) async{
    const adminUsername = "admin";
    const adminPassword = "admin123";

    if(username == adminUsername && password == adminPassword){
      final prefs = await SharedPreferences.getInstance();
      final token = base64Encode(utf8.encode(DateTime.now().toIso8601String()));
      final expiry = DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch;

      _currentUser = UserModel(username: username, token: token);
      prefs.setString('currentUser', jsonEncode(_currentUser!.toJson()));
      prefs.setInt('expiry', expiry);

      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  // logout process
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
  }
}