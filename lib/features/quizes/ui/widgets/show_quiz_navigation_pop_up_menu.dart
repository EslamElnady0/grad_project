import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/quizes/ui/widgets/quiz_navigation_pop_up.dart';
import '../../data/models/get_quiz_using_id_response.dart';
import '../cubit/quiz_navigation_cubit/quiz_question_navigation_cubit.dart';

void showQuizNavigationPopUpMenu(
    BuildContext ctx, GlobalKey actionKey, GetQuizByIdResponse data) {
  RenderBox renderBox =
      actionKey.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);
  showDialog(
    context: ctx,
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
              child: BlocProvider.value(
                value: ctx.read<QuizQuestionNavigatorCubit>(),
                child: QuizNavigationPopUp(quizQuestions: data.data.questions),
              )),
        ],
      );
    },
  );
}
