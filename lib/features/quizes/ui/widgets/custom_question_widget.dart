import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/quizes/ui/widgets/custom_mcq_choice_widget.dart';

import '../../../../core/theme/app_colors.dart';

class CustomQuestionWidget extends StatefulWidget {
  const CustomQuestionWidget({super.key});

  @override
  State<CustomQuestionWidget> createState() => _CustomQuestionWidgetState();
}

class _CustomQuestionWidgetState extends State<CustomQuestionWidget> {
  String selectedChoice = Constants.dummyChoices[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.lightCyan,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0.56),
              blurRadius: 8.92,
              color: AppColors.black.withOpacity(0.1),
            )
          ],
          borderRadius: BorderRadius.circular(13.r)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Text(
              "10 - What is the main purpose of encapsulation in Object-Oriented Programming (OOP)?",
              style: AppTextStyles.font13BlackSemiBold,
            ),
            vGap(16),
            //TODO : switch case on question type (mcq , written) and put its own widget
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomMcqChoiceWidget(
                    index: index,
                    choice: Constants.dummyChoices[index],
                    isSelected: selectedChoice == Constants.dummyChoices[index],
                    onTap: () {
                      setState(() {
                        selectedChoice = Constants.dummyChoices[index];
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => vGap(10),
                itemCount: 4)
          ],
        ),
      ),
    );
  }
}
