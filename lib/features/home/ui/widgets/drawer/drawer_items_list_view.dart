import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../models/drawer_item_model.dart';
import 'drawer_item.dart';

class DrawerItemsListView extends StatelessWidget {
  const DrawerItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems = Constants.drawerItemsLocalized(context);
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemBuilder: (context, index) => DrawerItem(
        iconPath: drawerItems[index].iconPath,
        title: drawerItems[index].title,
        onTap: drawerItems[index].onTap,
        index: index,
      ),
      itemCount: 7,
      separatorBuilder: (context, index) => vGap(12),
    );
  }
}
