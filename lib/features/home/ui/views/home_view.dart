import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_bottom_nav_bar.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../widgets/drawer/custom_drawer.dart';

class HomeView extends StatelessWidget {
  static const String screenName = "/home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBody: true,
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Constants
              .homeBodies[context.read<BottomNavBarCubit>().currentIndex];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}
