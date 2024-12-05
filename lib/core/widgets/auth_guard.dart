import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/presentation/views/login_screen.dart';

import '../../features/home/presentation/view_models/auth_viewmodel.dart';

class AuthGuard extends ConsumerStatefulWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  ConsumerState<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);

    // Check login state
    if (!authViewModel.isAuthenticated) {
      // Redirect to LoginScreen if not logged in
      Future.microtask(() {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      });
      return const SizedBox.shrink(); // Display an empty widget while redirecting
    }

    return widget.child; // Render the guarded child widget if authenticated
  }
}
