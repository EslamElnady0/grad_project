import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentAnalysisWidget extends StatefulWidget {
  const AssignmentAnalysisWidget({super.key});

  @override
  State<AssignmentAnalysisWidget> createState() =>
      _AssignmentAnalysisWidgetState();
}

class _AssignmentAnalysisWidgetState extends State<AssignmentAnalysisWidget> {
  int index = 0;
  List<String> texts = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    texts = [
      "${S.of(context).number_of_students_who_handed_assignment} : 50",
      "${S.of(context).Average_student_scores_in_this_assignment} : 8"
    ];
  }

  void _onSwipe(DragEndDetails details) {
    setState(() {
      index = (index + 1) % texts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onHorizontalDragEnd: _onSwipe,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                texts[index],
                key: ValueKey(index),
                style: AppTextStyles.font14DarkerBlueSemiBold,
              ),
            ),
          ),
        ),
        vGap(1),
        Positioned(
          left: 0,
          bottom: -5,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == i
                      ? AppColors.primaryColordark
                      : AppColors.lightGrayText,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
