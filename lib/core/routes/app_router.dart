import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/auth/presentation/views/forget_password_view.dart';
import 'package:grad_project/features/auth/presentation/views/confirm_account_view.dart';
import 'package:grad_project/features/chat/ui/views/chat_view.dart';
import 'package:grad_project/features/map/presentation/views/internal_map_view.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_details_view.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_view.dart';
import 'package:grad_project/features/splash/views/splash_view.dart';
import 'package:grad_project/features/weekly_schedule/ui/views/screens/weekly_schedule_view.dart';
import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import '../../features/home/ui/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.routeName,
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
        path: ForgetPasswordView.routeName,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: ChatView.routeName,
        builder: (context, state) => const ChatView(),
      ),
      GoRoute(
        path: ConfirmAccountView.routeName,
        builder: (context, state) => const ConfirmAccountView(),
      ),
      GoRoute(
        path: InternalMapView.routeName,
        builder: (context, state) => const InternalMapView(),
      ),
      GoRoute(
        path: WeeklyScheduleView.routeName,
        builder: (context, state) => const WeeklyScheduleView(),
      ),
      GoRoute(
        path: QuizDetailsView.routeName,
        builder: (context, state) => const QuizDetailsView(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const QuizView(),
      ),
    ],
  );
}
