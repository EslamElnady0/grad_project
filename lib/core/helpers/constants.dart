import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/annoucements/ui/views/annoucements_body.dart';
import 'package:grad_project/features/home/ui/models/drawer_item_model.dart';

import '../../features/home/ui/models/bottom_nav_bar_item_model.dart';
import '../../generated/l10n.dart';

class Constants {
  const Constants._();

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

  static List<DrawerItemModel> drawerItemsLocalized(BuildContext context) {
    return [
      DrawerItemModel(
        title: S.of(context).weeklySchedule,
        iconPath: Assets.imagesSvgsCalender,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).timeSchedule,
        iconPath: Assets.imagesSvgsTimeQuarter,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).internalMap,
        iconPath: Assets.imagesSvgsTime,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).academicProgress,
        iconPath: Assets.imagesSvgsTimeCheck,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).finalResults,
        iconPath: Assets.imagesSvgsGradHat,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).profile,
        iconPath: Assets.imagesSvgsPerson,
        onTap: () {},
      ),
      DrawerItemModel(
        title: S.of(context).logout,
        iconPath: Assets.imagesSvgsLogOut,
        onTap: () {},
      ),
    ];
  }

  static List<Widget> homeBodies = [
    AnnoucementsBody(),
    Container(),
    Container(),
    Container()
  ];
}
