import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/map/presentation/widgets/current_location_destination_container.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_secondary_gradient_button.dart';
import '../../../../generated/l10n.dart';
import '../view models/map cubit/map_cubit.dart';

class CustomDraggableBottomSheet extends StatelessWidget {
  final VoidCallback onClosePressed;
  final MapState state;
  const CustomDraggableBottomSheet(
      {super.key, required this.state, required this.onClosePressed});

  String formatDistance(double distance, BuildContext context) {
    if (distance < 1000) {
      return '${distance.toStringAsFixed(0)} ${S.of(context).meter}';
    }
    return '${(distance / 1000).toStringAsFixed(1)} ${S.of(context).km}';
  }

  String formatDuration(double duration, BuildContext context) {
    if (duration < 3600) {
      return '${(duration / 60).toStringAsFixed(1)} ${S.of(context).min}';
    }
    return '${(duration / 3600).toStringAsFixed(1)} ${S.of(context).hour}';
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.25,
      maxChildSize: 0.6,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                Text(
                  S.of(context).route_details,
                  style: AppTextStyles.font16DarkerBlueBold,
                ),
                vGap(16),
                Row(
                  children: [
                    Icon(Icons.directions,
                        color: AppColors.darkblue, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      '${S.of(context).distance}: ${formatDistance(state.distance!, context)}',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                  ],
                ),
                vGap(10),
                Row(
                  children: [
                    Icon(Icons.timer, color: AppColors.darkblue, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      '${S.of(context).duration}: ${formatDuration(state.duration!, context)}',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                  ],
                ),
                vGap(24),
                CurrentLocationDestinationContainer(
                  destination: state.markers.length > 1
                      ? "${state.markers[1].point.latitude.toStringAsFixed(6)}, ${state.markers[1].point.longitude.toStringAsFixed(6)}"
                      : "غير معروف",
                ),
                vGap(30),
                Align(
                    alignment: Alignment.center,
                    child: CustomSecondaryGradientButton(
                      onTap: () {},
                      title: S.of(context).start,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
