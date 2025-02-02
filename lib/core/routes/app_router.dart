import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/home/ui/views/home_view.dart';

abstract class AppRouter {
  static const kAuthView = '/authView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavBarCubit(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: HomeView.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavBarCubit(),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
