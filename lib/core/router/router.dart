import 'package:cat_app_flutter/core/utils/constants/routes.dart';
import 'package:cat_app_flutter/features/authentication/presentation/screens/tuto_screen.dart';
import 'package:cat_app_flutter/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

const _initialRoute = AppRoutes.baseRoute + AppRoutes.welcomeRoute;
const _welcomeRoute = AppRoutes.baseRoute + AppRoutes.welcomeRoute;

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: _initialRoute,
  routes: [
    GoRoute(
      path: _welcomeRoute,
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],
);
