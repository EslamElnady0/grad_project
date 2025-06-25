import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/academic_progress/presentation/views/academic_progress_view.dart';
import 'package:grad_project/features/annoucements/ui/views/annoucements_body.dart';
import 'package:grad_project/features/assignments/presentation/views/assignment_home_view.dart';
import 'package:grad_project/features/auth/ui/views/auth_view.dart';
import 'package:grad_project/features/dashboard/ui/views/dashboard_body.dart';
import 'package:grad_project/features/final_results/presentation/views/final_results_view.dart';
import 'package:grad_project/features/forum/ui/views/forum_views.dart';
import 'package:grad_project/features/home/ui/models/drawer_item_model.dart';
import 'package:grad_project/features/parking/ui/views/parking_view.dart';
import 'package:grad_project/features/subjects/ui/views/lecture_manager_view.dart';
import 'package:grad_project/features/profile/presentation/views/profile_view.dart';
import 'package:grad_project/features/quizes/ui/models/quiz_advice_model.dart';
import 'package:grad_project/features/quizes/ui/views/quiz_management_view_body.dart';
import 'package:grad_project/features/subjects/ui/views/lecture_manager_view.dart';
import 'package:grad_project/features/subjects/ui/views/subjects_view.dart';
import 'package:grad_project/features/time_schedule/presentation/views/time_schedule_view.dart';
import '../../features/chat/data/models/get_messages_response.dart';
import '../../features/chat/ui/views/chat_outsider_body.dart';
import '../../features/home/ui/models/bottom_nav_bar_item_model.dart';
import '../../features/map/presentation/views/internal_map_view.dart';
import '../../features/weekly_schedule/ui/screens/weekly_schedule_view.dart';
import '../../generated/l10n.dart';
import '../widgets/decorated_input_border.dart';

class Constants {
  const Constants._();
  static const String token = "token";
  static const String userId = "userId";
  static const LinearGradient primaryGrad = LinearGradient(
    colors: [AppColors.primaryColorlight, AppColors.primaryColordark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient secondaryGrad = LinearGradient(
    colors: [AppColors.redlight, AppColors.redDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient whiteGrad = LinearGradient(
    colors: [AppColors.backGround, AppColors.veryLightCyan],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static List<BottomNavBarItemModel> bottomNavBarItemsLocalized(
      BuildContext context) {
    return [
      BottomNavBarItemModel(
        title: S.of(context).announcements,
        iconPath: Assets.imagesSvgsAnnoucementIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).courses,
        iconPath: Assets.imagesSvgsCoursesIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).chat,
        iconPath: Assets.imagesSvgsChatIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).community,
        iconPath: Assets.imagesSvgsCommunityIcon,
      ),
    ];
  }

  static List<BottomNavBarItemModel> adminBottomNavBarItemsLocalized(
      BuildContext context) {
    return [
      BottomNavBarItemModel(
        title: S.of(context).dashboard,
        iconPath: Assets.imagesSvgsDashboardIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).news,
        iconPath: Assets.imagesSvgsCoursesIcon,
      ),
      BottomNavBarItemModel(
        title: "",
        iconPath: Assets.imagesSvgsAnnoucementIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).quizzes,
        iconPath: Assets.imagesSvgsCommunityIcon,
      ),
      BottomNavBarItemModel(
        title: S.of(context).assignments,
        iconPath: Assets.imagesSvgsAssignmentsIcon,
      ),
    ];
  }

  static List<DrawerItemModel> drawerItemsLocalized(BuildContext context) {
    return [
      DrawerItemModel(
        title: S.of(context).weeklySchedule,
        iconPath: Assets.imagesSvgsCalender,
        onTap: () {
          GoRouter.of(context).push(WeeklyScheduleView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).timeSchedule,
        iconPath: Assets.imagesSvgsTimeQuarter,
        onTap: () {
          GoRouter.of(context).push(TimeScheduleView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).internalMap,
        iconPath: Assets.imagesSvgsTime,
        onTap: () {
          GoRouter.of(context).push(InternalMapView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).academicProgress,
        iconPath: Assets.imagesSvgsTimeCheck,
        onTap: () {
          GoRouter.of(context).push(AcademicProgressView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).finalResults,
        iconPath: Assets.imagesSvgsGradHat,
        onTap: () {
          GoRouter.of(context).push(FinalResultsView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).profile,
        iconPath: Assets.imagesSvgsPerson,
        onTap: () {
          GoRouter.of(context).push(ProfileView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).logout,
        iconPath: Assets.imagesSvgsLogOut,
        onTap: () {
          //toDo: remove token and apply pushAndRemoveUntil
          GoRouter.of(context).pushReplacementNamed(AuthView.routeName);
        },
      ),
    ];
  }

  static List<DrawerItemModel> doctorDrawerItemsLocalized(
      BuildContext context) {
    return [
      DrawerItemModel(
        title: S.of(context).students_management,
        iconPath: Assets.imagesSvgsTwoPersonsIcon,
        onTap: () {
          // GoRouter.of(context).push(WeeklyScheduleView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).forum_management,
        iconPath: Assets.imagesSvgsCommentBubbleIcon,
        onTap: () {
          GoRouter.of(context).push(ForumViews.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).weekly_schedule,
        iconPath: Assets.imagesSvgsTimeQuarter,
        onTap: () {
          GoRouter.of(context).push(WeeklyScheduleView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).finalResults,
        iconPath: Assets.imagesSvgsTimeCheck,
        onTap: () {
          // GoRouter.of(context).push(AcademicProgressView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).profile,
        iconPath: Assets.imagesSvgsPerson,
        onTap: () {
          GoRouter.of(context).push(ProfileView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).parkingSlots,
        iconPath: Assets.imagesSvgsParkingIcon,
        onTap: () {
          GoRouter.of(context).push(ParkingView.routeName);
        },
      ),
      DrawerItemModel(
        title: S.of(context).logout,
        iconPath: Assets.imagesSvgsLogOut,
        onTap: () {},
      ),
    ];
  }

  static List<QuizAdviceModel> localizedQuizAdviceList(context) {
    return [
      QuizAdviceModel(
        title: S.of(context).prepareWell,
        description: S.of(context).reviewTopics,
      ),
      QuizAdviceModel(
        title: S.of(context).manageTime,
        description: S.of(context).timeManagement,
      ),
      QuizAdviceModel(
        title: S.of(context).readCarefully,
        description: S.of(context).understandBeforeAnswering,
      ),
      QuizAdviceModel(
        title: S.of(context).stayCalm,
        description: S.of(context).stayConfident,
      ),
    ];
  }

  static OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(
        color: AppColors.black,
        width: 1.5,
      ));

  static DecoratedInputBorder shadowedInputBorder = DecoratedInputBorder(
      shadow: BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 16,
          spreadRadius: 1,
          color: AppColors.black.withOpacity(0.15)),
      child: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ));
  static List<Widget> homeBodies = [
    const AnnoucementsBody(), //                  const AnnoucementsBody(),
    const SubjectsView(),
    const ChatOutsiderBody(),
    const ForumViews()
  ];
  static List<Widget> adminHomeBodies = [
    const DashboardBody(),
    const AnnoucementsBody(),
    const LectureManagerView(),
    const QuizManagementViewBody(),
    const AssignmentHomeView()
  ];
  static List<Message> dummyMessages = [
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsdfsdffsdfsdffsdfsdf",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
    Message(
        id: "1",
        content: "Hello fsjkhfksdfjsdfkjjfljfsjfsd ",
        sender: Sender(id: 1, name: "John Doe", avatar: ""),
        createdAt: DateTime.now(),
        status: Status(deliveredTo: [], seenBy: [])),
  ];
  static const List<String> dummyAnswers = [
    "To allow multiple inheritance",
    "To hide the internal state of an object and protect it from unauthorized access",
    "To increase the speed of code execution",
    "To provide a way to write code without any classes",
  ];
  static const List<String> dummyChoices = [
    "A)",
    "B)",
    "C)",
    "D)",
  ];

  static const List<String> info = [
    "إسلام إيهاب محمد لطفي",
    "علوم حاسب (CS)",
    "الرابعة",
    "A",
    "6",
    "B-"
  ];
}
