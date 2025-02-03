import 'package:go_router/go_router.dart';
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
    ],
  );
}
