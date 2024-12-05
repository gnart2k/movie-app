import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/presentation/views/home_screen.dart';
import 'package:movie_app/features/home/presentation/views/login_screen.dart';
import 'package:movie_app/features/home/subscription_page/presentation/views/subscription_page.dart';
import 'package:movie_app/features/movie_and_show/presentation/views/movie_and_show_page.dart';
import 'package:movie_app/features/movie_open_page/presentation/views/movies_open_page.dart';
import 'package:movie_app/features/show_page_open/views/show_page_open.dart';
import 'package:movie_app/features/support_page/presentation/views/support_page.dart';

class Routes {

  static const String loginRoute = "/login";
  static const String homeRoute = "/";
  static const String movieAndShowPage = "/movieAndShowPage";
  static const String movieOpen = "/movieOpen";
  static const String showOpen = "/showOpen";
  static const String support = "/support";
  static const String subscription = "/subscription";
}

class RouteGenerator {
  RouteGenerator._internal();
  static final RouteGenerator instance =
  RouteGenerator._internal();

  factory RouteGenerator() => instance;

  final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: 'login',
        path: Routes.loginRoute,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        name: 'home',
        path: Routes.homeRoute,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        name: 'movieAndShowPage',
        path: Routes.movieAndShowPage,
        builder: (context, state) => const MovieAndShowPage()),
    GoRoute(
        name: 'movieOpen',
        path: Routes.movieOpen,
        builder: (context, state) => MovieOpenPage()),
    GoRoute(
        name: 'showOpen',
        path: Routes.showOpen,
        builder: (context, state) => ShowPageOpenPage()),
    GoRoute(
        name: 'support',
        path: Routes.support,
        builder: (context, state) => const SupportPage()),
    GoRoute(
        name: 'subscription',
        path: Routes.subscription,
        builder: (context, state) => const SubscriptionPage()),
  ]);
}
