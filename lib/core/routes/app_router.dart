
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/splash/views/splash_view.dart';

import '../../features/auth/presentation/views/auth_view.dart';

abstract class AppRouter {
  static const kAuthView = '/authView'; 


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
       builder: (context, state) => SplashView(),
      ),
    GoRoute(
        path: kAuthView,
       builder: (context, state) => const AuthView(),
      ),
    ],
  );
}
