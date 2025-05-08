import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/full_screen_image_view.dart';
import 'package:grad_project/features/academic_progress/presentation/views/academic_progress_view.dart';
import 'package:grad_project/features/auth/ui/views/forget_password_view.dart';
import 'package:grad_project/features/auth/ui/views/confirm_account_view.dart';
import 'package:grad_project/features/chat/ui/views/chat_view.dart';
import 'package:grad_project/features/final_results/presentation/views/final_results_view.dart';
import 'package:grad_project/features/forum/ui/views/answers_view.dart';
import 'package:grad_project/features/map/presentation/views/internal_map_view.dart';
import 'package:grad_project/features/profile/presentation/views/profile_view.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_details_view.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_view.dart';
import 'package:grad_project/features/time_schedule/presentation/views/time_schedule_view.dart';
import 'package:grad_project/features/weekly_schedule/ui/screens/weekly_schedule_view.dart';
import '../../features/auth/ui/views/auth_view.dart';
import '../../features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import '../../features/home/ui/views/home_view.dart';
import '../../features/subjects/ui/views/materials_view.dart';

abstract class StudentRouter {
  static GoRouter getRouter(bool isLogin) {
    return GoRouter(
      initialLocation: isLogin ? HomeView.routeName : AuthView.routeName,
      routes: [
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
          path: QuizView.routeName,
          builder: (context, state) => const QuizView(),
        ),
        GoRoute(
          path: ProfileView.routeName,
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: AcademicProgressView.routeName,
          builder: (context, state) => const AcademicProgressView(),
        ),
        GoRoute(
            path: MaterialsView.routeName,
            builder: (context, state) => MaterialsView(
                  courseId: state.extra as int,
                )),
        GoRoute(
            path: AnswersView.routeName,
            builder: (context, state) => const AnswersView()),
        GoRoute(
            path: TimeScheduleView.routeName,
            builder: (context, state) => const TimeScheduleView()),
        GoRoute(
            path: FinalResultsView.routeName,
            builder: (context, state) => const FinalResultsView()),
        GoRoute(
          path: FullScreenImageView.routeName,
          builder: (context, state) => FullScreenImageView(
            imageUrl: state.extra as String,
          ),
        )
      ],
    );
  }
}
