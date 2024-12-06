import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/app/presentation/app_layout.dart';

import '../../features/home/presentation/view_models/auth_viewmodel.dart';

class AuthGuard extends ConsumerStatefulWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  ConsumerState<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    _startTokenCheckTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTokenCheckTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _checkAuthentication();
    });
  }

  Future<void> _checkAuthentication() async {
    final authViewModel = ref.read(authViewModelProvider);
    // Check if token is expired or not logged in
    if (!authViewModel.isAuthenticated || await authViewModel.isTokenExpired) {
      await authViewModel.logout();
      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);

    // Check state every time widget is built
    if (!authViewModel.isAuthenticated) {
      return const SizedBox.shrink(); // Return empty widget when not validating
    }

    return AppLayout(child: widget.child); // Show child widget if authentication is valid
  }
}
