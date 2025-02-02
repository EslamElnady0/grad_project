import 'package:flutter/material.dart';
import 'package:grad_project/features/home/ui/widgets/bottom%20nav%20bar/custom_bottom_nav_bar.dart';

import '../../../../core/widgets/custom_scaffold.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String screenName = "home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBody: true,
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
