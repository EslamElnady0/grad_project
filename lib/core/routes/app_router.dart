import 'package:go_router/go_router.dart';
import 'package:grad_project/features/auth/presentation/forget_password_view.dart';
import 'package:grad_project/features/auth/presentation/views/confirm_account_view.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/splash/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: AuthView.routeName,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: ForgetPasswordView.routeName,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: ConfirmAccountView.routeName,
        builder: (context, state) => const ConfirmAccountView(),
      ),
    ],
  );
}
