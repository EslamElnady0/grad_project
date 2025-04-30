import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/List_cubit.dart';
import '../../../../core/helpers/localizationa.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';


class DisplayList extends StatelessWidget {

  final List<String> listValue;
  final Function(String)? onSelected;
  const DisplayList({
    super.key,

    required this.listValue,

    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit(listValue[0]),
      child: Builder(
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Adjust shadow color
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PopupMenuButton<String>(
              onSelected: (week) {
                // Update the selected week in the Cubit
                context.read<ListCubit>().selectWeek(week);
                if (onSelected != null) {
                  onSelected!(week);
                }
              },
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              padding: EdgeInsets.zero,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<ListCubit, String>(
                    builder: (context, selectedValue) {
                      return Text(selectedValue,
                          style: AppTextStyles.font12GraySemiBold);
                    },
                  ),
                  hGap(40),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.gray,
                    size: 20.h,
                  ),
                ],
              ),
              itemBuilder: (context) {
             
 
                return listValue.map((week) {
                  return PopupMenuItem<String>(
                    value: week,
                    child: Text(
                      week,
                      style: AppTextStyles.font13BlackBold
                          .copyWith(color: AppColors.darkGray),
                    ),
                  );
                }).toList();
              },
            ),
          );
        },
      ),
    );
  }
}
