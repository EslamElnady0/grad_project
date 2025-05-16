import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../view models/map cubit/map_cubit.dart';

class CustomDraggableBottomSheet extends StatelessWidget {
  final VoidCallback onClosePressed;
  final MapState state;
  const CustomDraggableBottomSheet(
      {super.key, required this.state, required this.onClosePressed});

  // Format distance (meters to km or m)
  String formatDistance(double distance) {
    if (distance < 1000) {
      return '${distance.toStringAsFixed(0)} m';
    }
    return '${(distance / 1000).toStringAsFixed(1)} km';
  }

  // Format duration (seconds to min or hr)
  String formatDuration(double duration) {
    if (duration < 3600) {
      return '${(duration / 60).toStringAsFixed(1)} min';
    }
    return '${(duration / 3600).toStringAsFixed(1)} hr';
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 0.5,
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
                  'Route Details',
                  style: AppTextStyles.font16DarkerBlueBold,
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(Icons.directions,
                        color: AppColors.darkblue, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      'Distance: ${formatDistance(state.distance!)}',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.timer, color: AppColors.darkblue, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      'Duration: ${formatDuration(state.duration!)}',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: onClosePressed,
                    child: Text(
                      'Close',
                      style: AppTextStyles.font14DarkBlueMedium.copyWith(
                        color: AppColors.darkblue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
