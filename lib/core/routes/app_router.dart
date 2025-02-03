<<<<<<< HEAD
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/auth/presentation/forget_password_view.dart';
import 'package:grad_project/features/auth/presentation/views/confirm_account_view.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/chat/ui/views/chat_view.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
>>>>>>> a1eade4ea9ad163f52a625678cb808958c19ed1d
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/home/ui/views/home_view.dart';

abstract class AppRouter {
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
        path: AuthView.routeName,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
<<<<<<< HEAD
        path: ForgetPasswordView.routeName,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: ConfirmAccountView.routeName,
        builder: (context, state) => const ConfirmAccountView(),
=======
        path: HomeView.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavBarCubit(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: ChatView.routeName,
        builder: (context, state) => const ChatView(),
>>>>>>> a1eade4ea9ad163f52a625678cb808958c19ed1d
      ),
    ],
  );
}
