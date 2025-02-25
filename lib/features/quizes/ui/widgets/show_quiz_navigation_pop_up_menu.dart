import 'package:flutter/material.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_navigation_pop_up.dart';

void showQuizNavigationPopUpMenu(BuildContext context, GlobalKey actionKey) {
  RenderBox renderBox =
      actionKey.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.1),
            ),
          ),
          Positioned(
              left: offset.dx,
              top: offset.dy - 50,
              child: const QuizNavigationPopUp()),
        ],
      );
    },
  );
}
