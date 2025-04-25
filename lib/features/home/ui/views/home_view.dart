import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_admin_bottom_navigation_bar.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_student_bottom_nav_bar.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../widgets/drawer/custom_doctor_drawer.dart';
import '../widgets/drawer/custom_drawer.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBody: true,
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return IndexedStack(
            index: context.read<BottomNavBarCubit>().currentIndex,
            children: FlavorsFunctions.isStudent()
                ? Constants.homeBodies
                : Constants.adminHomeBodies,
          );
        },
      ),
      bottomNavigationBar: FlavorsFunctions.isStudent()
          ? const CustomStudentBottomNavigationBar()
          : const CustomAdminBottomNavigationBar(),
      drawer: FlavorsFunctions.isStudent()
          ? const CustomDrawer()
          : const CustomDoctorDrawer(),
    );
  }
}
