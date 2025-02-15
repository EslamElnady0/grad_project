import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../core/helpers/spacing.dart';
import 'most_searched_place_item.dart';

class MostSearchedPlacesWidget extends StatelessWidget {
  const MostSearchedPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        S.of(context).mostSreached,
        style: AppTextStyles.font16BlackSemiBold,
      ),
      vGap(12),
      SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
            MostSearchedPlaceItem(
              title: "dfjghhffgshdjfgsddfhjdsfgjsdhfsdjhg",
            ),
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
            MostSearchedPlaceItem(
              title: S.of(context).whereAmINow,
            ),
          ],
        ),
      )
    ]);
  }
}
