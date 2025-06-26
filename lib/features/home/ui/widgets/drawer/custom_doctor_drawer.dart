import 'package:flutter/material.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../models/drawer_item_model.dart';
import 'drawer_items_list_view.dart';
import 'drawer_top.dart';

class CustomDoctorDrawer extends StatelessWidget {
  const CustomDoctorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems =
        Constants.doctorDrawerItemsLocalized(context);

    return Drawer(
      backgroundColor: AppColors.backGround,
      child: Column(
        children: [
          const DrawerTop(),
          vGap(12),
          Expanded(
              child: DrawerItemsListView(
            drawerItems: drawerItems,
          )),
        ],
      ),
    );
  }
}
