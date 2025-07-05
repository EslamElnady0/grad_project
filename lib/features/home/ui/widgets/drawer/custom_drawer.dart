import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/logic/unsub_to_notifications_cubit/unsub_to_notifications_cubit.dart';
import '../../models/drawer_item_model.dart';
import 'drawer_items_list_view.dart';
import 'drawer_top.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems = Constants.drawerItemsLocalized(context);
    return BlocProvider(
      create: (context) => getIt<UnsubToNotificationsCubit>(),
      child: Drawer(
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
      ),
    );
  }
}
