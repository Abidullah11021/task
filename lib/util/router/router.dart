import 'package:go_router/go_router.dart';
import 'package:task/features/auth/presentation/views/login_view.dart';
import 'package:task/features/auth/presentation/views/register_view.dart';
import 'package:task/features/home/presentation/views/home_view.dart';
import 'package:task/util/router/paths.dart';

final router = GoRouter(
  initialLocation: RoutePaths.login,
  routes: [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signup,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
