import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

import '../view models/map cubit/map_cubit.dart';
import 'internal_map_rebuild_body.dart';

class InternalMapViewBody extends StatefulWidget {
  const InternalMapViewBody({super.key});

  @override
  State<InternalMapViewBody> createState() => _InternalMapViewBodyState();
}

class _InternalMapViewBodyState extends State<InternalMapViewBody> {
  @override
  void initState() {
    context.read<MapCubit>().mapTextEditingController = TextEditingController();
    context.read<MapCubit>().mapTextFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(
              title: S.of(context).internalMap,
            ),
            vGap(10),
            TitleTextWidget(text: S.of(context).discoverYourWay),
            vGap(16),
            InternalMapRebuildBody(),
          ],
        ),
      ),
    );
  }
}
