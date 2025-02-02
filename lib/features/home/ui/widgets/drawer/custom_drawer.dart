import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';

import 'drawer_items_list_view.dart';
import 'drawer_top.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backGround,
      child: Column(
        children: [
          DrawerTop(),
          vGap(12),
          Expanded(child: DrawerItemsListView()),
        ],
      ),
    );
  }
}
