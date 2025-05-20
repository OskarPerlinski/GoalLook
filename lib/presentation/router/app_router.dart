import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/domain/league/models/league_models.dart';
import 'package:goallook/presentation/router/routes/app_routes.dart';
import 'package:goallook/presentation/screens/auth/auth_selection/auth_selection_page.dart';
import 'package:goallook/presentation/screens/auth/create_account/create_account_page.dart';
import 'package:goallook/presentation/screens/auth/login/login_page.dart';
import 'package:goallook/presentation/screens/auth/reset_password/reset_password_page.dart';
import 'package:goallook/presentation/screens/home/home_page.dart';
import 'package:goallook/presentation/screens/league_collections/league_collections_page.dart';
import 'package:goallook/presentation/screens/splash/splash_page.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splashPage,
    routes: $appRoutes,
  );
}

@TypedGoRoute<SelectionPageRoute>(path: AppRoutes.selectionPage)
class SelectionPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthSelectionPage();
  }
}

@TypedGoRoute<LoginPageRoute>(path: AppRoutes.loginPage)
class LoginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<CreateAccountRoute>(path: AppRoutes.createAccount)
class CreateAccountRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateAccountPage();
  }
}

@TypedGoRoute<ResetPasswordRoute>(path: AppRoutes.resetPassword)
class ResetPasswordRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ResetPasswordPage();
  }
}

@TypedGoRoute<HomePageRoute>(path: AppRoutes.homePage)
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<SplashPageRoute>(path: AppRoutes.splashPage)
class SplashPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<LeagueCollectionsRoute>(path: AppRoutes.leagueCollections)
class LeagueCollectionsRoute extends GoRouteData {
  LeagueCollectionsRoute({required this.leagueId});

  final String leagueId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final leagueModels = state.extra as LeagueModels;
    return LeagueCollectionsPage(
      leagueId: leagueId,
      leagueModels: leagueModels,
    );
  }
}
