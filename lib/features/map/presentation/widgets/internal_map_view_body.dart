import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../core/widgets/custom_search_text_field.dart';
import 'most_searched_places_widget.dart';

class InternalMapViewBody extends StatelessWidget {
  const InternalMapViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          CustomInnerScreensAppBar(
            title: S.of(context).internalMap,
          ),
          vGap(10),
          TitleTextWidget(text: S.of(context).discoverYourWay),
          vGap(16),
          Text(
            S.of(context).didntSreachYet,
            style: AppTextStyles.font15BlackSemiBold,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          vGap(22),
          Image.asset(
            Assets.imagesMapTrail,
            height: 156.h,
          ),
          vGap(22),
          Text(
            S.of(context).writeYourPlace,
            style: AppTextStyles.font15BlackSemiBold,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          vGap(16),
          CustomSearchTextField(
            hintText: S.of(context).searchForBuilding,
          ),
          vGap(16),
          MostSearchedPlacesWidget(),
        ],
      ),
    );
  }
}
