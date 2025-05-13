import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/router/routes/app_routes.dart';
import 'package:goallook/presentation/screens/auth/auth_selection/auth_selection_page.dart';
import 'package:goallook/presentation/screens/auth/login/login_page.dart';

part 'app_router.g.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.selectionPage,
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
