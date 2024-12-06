import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/app/presentation/app_layout.dart';
import 'package:movie_app/features/home/presentation/view_models/auth_viewmodel.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/home/presentation/views/login_screen.dart';
import 'package:movie_app/features/movie_and_show/presentation/views/movie_and_show_page.dart';
import 'package:movie_app/features/show_page_open/views/show_page_open.dart';
import 'package:movie_app/features/support_page/presentation/views/support_page.dart';
import '../../features/movie_open_page/presentation/views/movies_open_page.dart';
import '../../features/subscription_page/presentation/views/subscription_page.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeRoute = "/Home";
  static const String movieAndShowPage = "/MoviesShows";
  static const String movieOpen = "/movieOpen/:id";
  static const String showOpen = "/showOpen/:id";
  static const String support = "/Support";
  static const String subscription = "/Subscriptions";
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  RouteGenerator._internal();

  static final RouteGenerator instance = RouteGenerator._internal();
  factory RouteGenerator() => instance;

  final router = GoRouter(
    initialLocation: Routes.homeRoute,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: authViewModelProvider.read(ProviderContainer()),
    redirect: (context, state) async {
      final container = ProviderScope.containerOf(context);
      final authViewModel = container.read(authViewModelProvider);

      if (!authViewModel.isAuthenticated) {
        return '/login';
      } else if (await authViewModel.isTokenExpired) {
        await authViewModel.logout();
        return '/login';
      }
      return null; // No redirection needed
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppLayout(child: child);
        },
        routes: [
          GoRoute(
            name: 'home',
            path: Routes.homeRoute,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            name: 'movieAndShowPage',
            path: Routes.movieAndShowPage,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const MovieAndShowPage(),
            ),
          ),
          GoRoute(
            name: 'support',
            path: Routes.support,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SupportPage(),
            ),
          ),
          GoRoute(
            name: 'subscription',
            path: Routes.subscription,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SubscriptionPage(),
            ),
          ),
          GoRoute(
            name: 'movieOpen',
            path: Routes.movieOpen,
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: MovieOpenPage(id: id),
              );
            },
          ),
          GoRoute(
            name: 'showOpen',
            path: Routes.showOpen,
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: ShowPageOpenPage(id: id),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: 'login',
        path: Routes.loginRoute,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
    ],
  );
}

class DelayedPageTransition extends StatefulWidget {
  final Widget child;
  const DelayedPageTransition({super.key, required this.child});

  @override
  _DelayedPageTransitionState createState() => _DelayedPageTransitionState();
}

class _DelayedPageTransitionState extends State<DelayedPageTransition>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPageVisible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isPageVisible = true;
        });
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isPageVisible) {
      return const SizedBox.shrink();
    }

    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: DelayedPageTransition(child: child),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}