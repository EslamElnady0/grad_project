import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_admin_bottom_navigation_bar.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_student_bottom_nav_bar.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import '../../../annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import '../../../annoucements/ui/ui cubit/announcement_filter_cubit.dart';
import '../widgets/drawer/custom_doctor_drawer.dart';
import '../widgets/drawer/custom_drawer.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAnnouncementCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTeacherCourcesCubit>(),
        ),
        BlocProvider(
          create: (context) => AnnouncementFilterCubit(),
        ),
      ],
      child: CustomScaffold(
        extendBody: true,
        body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            return FlavorsFunctions.isStudent()
                ? Constants
                    .homeBodies[context.read<BottomNavBarCubit>().currentIndex]
                : Constants.adminHomeBodies[
                    context.read<BottomNavBarCubit>().currentIndex];
          },
        ),
        bottomNavigationBar: FlavorsFunctions.isStudent()
            ? const CustomStudentBottomNavigationBar()
            : const CustomAdminBottomNavigationBar(),
        drawer: FlavorsFunctions.isStudent()
            ? const CustomDrawer()
            : const CustomDoctorDrawer(),
      ),
    );
  }
}
