import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/app/presentation/app_layout.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/home/presentation/views/login_screen.dart';
import 'package:movie_app/features/home/subscription_page/presentation/views/subscription_page.dart';
import 'package:movie_app/features/movie_and_show/presentation/views/movie_and_show_page.dart';
import 'package:movie_app/features/movie_open_page/presentation/views/movies_open_page.dart';
import 'package:movie_app/features/show_page_open/views/show_page_open.dart';
import 'package:movie_app/features/support_page/presentation/views/support_page.dart';

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
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return AppLayout(
                child: child,
              );
            },
            routes: [
              GoRoute(
                  name: 'home',
                  path: Routes.homeRoute,
                  builder: (context, state) => const HomeScreen()),
              GoRoute(
                  name: 'movieAndShowPage',
                  path: Routes.movieAndShowPage,
                  builder: (context, state) => const MovieAndShowPage()),
              GoRoute(
                  name: 'support',
                  path: Routes.support,
                  builder: (context, state) => const SupportPage()),
              GoRoute(
                  name: 'subscription',
                  path: Routes.subscription,
                  builder: (context, state) => const SubscriptionPage()),
              GoRoute(
                  name: 'movieOpen',
                  path: Routes.movieOpen,
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return MovieOpenPage(id: id);
                  }),
              GoRoute(
                  name: 'showOpen',
                  path: Routes.showOpen,
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return ShowPageOpenPage(id: id);
                  }),
            ]),
        GoRoute(
            name: 'login',
            path: Routes.loginRoute,
            builder: (context, state) => const LoginScreen()),
      ]);
}
