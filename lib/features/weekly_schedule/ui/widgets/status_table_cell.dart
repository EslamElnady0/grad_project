import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/show_status_bottom_sheet.dart';

class StatusTableCell extends StatelessWidget {
  const StatusTableCell({
    super.key,
    required this.status,
    required this.height,
    required this.lecture,
    required this.context,
  });

  final String status;
  final double height;
  final SessionResponse lecture;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: 
    
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                if (status.toLowerCase() == 'postponed')  hGap(5),
                GestureDetector(
                  onTap: status.toLowerCase() == 'postponed' ? () {
                    // Handle postponed status tap
                    print('Postponed status tapped');
                  } : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: status.toLowerCase() == 'postponed' 
                        ? BoxDecoration(
                            color: AppColors.primaryColordark.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.primaryColordark),
                          )
                        : null,
                    child: Text(
                      status,
                      style: AppTextStyles.font11BlackSemiBold.copyWith(
                        color: status.toLowerCase() == 'postponed' 
                            ? AppColors.primaryColordark 
                            : AppColors.darkblue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
  if(FlavorsFunctions.isAdmin()) const Spacer(),
               if(FlavorsFunctions.isAdmin()) GestureDetector(
                    onTap: () => showStatusBottomSheet(lecture, context),
                    child: Icon(
                      Icons.more_vert,
                      color: AppColors.primaryColordark,
                      size: 20.sp,
                    ),
                  ),
         if(FlavorsFunctions.isAdmin())         hGap(5)
               ],
             )
            
      
    );
  }
}
