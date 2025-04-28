import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/quizes/ui/cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/title_and_drop_down_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AddQuizDropDowns extends StatelessWidget {
  const AddQuizDropDowns({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Column(children: [
        Row(
          children: [
            Expanded(
              child: TitleAndDropDownWidget<int>(
                title: S.of(context).setTime,
                value:
                    "${context.read<AddQuizCubit>().selectedTime}  ${S.of(context).minute}",
                type: S.of(context).minute,
                contentList: context.read<AddQuizCubit>().timeList,
                onSelected: (value) {
                  setState(() {
                    context.read<AddQuizCubit>().selectedTime = value;
                  });
                },
              ),
            ),
            hGap(16),
            Expanded(
              child: TitleAndDropDownWidget<int>(
                title: S.of(context).questionsCount,
                value:
                    "${context.read<AddQuizCubit>().selectedQuestionsCount}  ${S.of(context).questions}",
                type: S.of(context).questionsWithNoThe,
                contentList: context.read<AddQuizCubit>().questionsCount,
                onSelected: (value) {
                  setState(() {
                    context.read<AddQuizCubit>().selectedQuestionsCount = value;
                    context.read<AddQuizCubit>().finalDegree = value *
                        context.read<AddQuizCubit>().selectedQuestionGrade;
                    log("# of questinos ${context.read<AddQuizCubit>().selectedQuestionsCount}");
                  });
                },
              ),
            ),
          ],
        ),
        vGap(12),
        Row(
          children: [
            Expanded(
              child: TitleAndDropDownWidget<int>(
                title: S.of(context).questionGrade,
                value:
                    "${context.read<AddQuizCubit>().selectedQuestionGrade}  ${S.of(context).single_grade}",
                type: S.of(context).single_grade,
                contentList: context.read<AddQuizCubit>().questionGrade,
                onSelected: (value) {
                  setState(() {
                    context.read<AddQuizCubit>().selectedQuestionGrade = value;
                    context.read<AddQuizCubit>().finalDegree = value *
                        context.read<AddQuizCubit>().selectedQuestionsCount;
                  });
                },
              ),
            ),
            hGap(16),
            Expanded(
              child: TitleAndDropDownWidget(
                title: S.of(context).finalGrade,
                value:
                    "${context.read<AddQuizCubit>().finalDegree} ${S.of(context).single_grade}",
                contentList: const [],
                onSelected: (value) {
                  setState(() {});
                },
                isFinalGrade: true,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
