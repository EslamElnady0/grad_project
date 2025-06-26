import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/generated/l10n.dart';
import 'internal_map_rebuild_body.dart';

class InternalMapViewBody extends StatelessWidget {
  const InternalMapViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: CustomInnerScreensAppBar(
            title: S.of(context).internalMap,
          ),
        ),
        const Expanded(child: InternalMapRebuildBody()),
      ],
    );
  }
}
