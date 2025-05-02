import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/List_cubit.dart';
import '../helpers/spacing.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DisplayList extends StatelessWidget {
  final List<String> listValue;
  final String? initialValue;  
  final Function(int)? onSelected;

  const DisplayList({
    super.key,
    required this.listValue,
    this.onSelected, this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListCubit(initialValue ?? listValue[0]),
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
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PopupMenuButton<int>(
              // Change type to int
              onSelected: (index) {

                context.read<ListCubit>().selectWeek(listValue[index]);
                if (onSelected != null) {
                  onSelected!(index); 
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
                          style: AppTextStyles.font12GraySemiBold.copyWith(
                            color: AppColors.darkblue
                          ));
                    },
                  ),
                  hGap(40),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.darkblue,
                    size: 20.h,
                  ),
                ],
              ),
              itemBuilder: (context) {
                return List.generate(listValue.length, (index) {
                  return PopupMenuItem<int>(
                    // Change type to int
                    value: index, // Use index as value
                    child: Text(
                      listValue[index],
                      style: AppTextStyles.font13BlackBold
                          .copyWith(color: AppColors.darkblue),
                    ),
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
