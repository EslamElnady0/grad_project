import 'package:flutter/widgets.dart';
import 'package:grad_project/features/quizes/ui/widgets/title_and_drop_down_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDegreeWidget extends StatefulWidget {
  const AssignmentDegreeWidget({super.key});

  @override
  State<AssignmentDegreeWidget> createState() => _AssignmentDegreeWidgetState();
}

class _AssignmentDegreeWidgetState extends State<AssignmentDegreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: /*TitleAndDropDownWidget<int>(
        title: S.of(context).questionGrade,
        value:
            "${context.read<AddQuizCubit>().selectedQuestionGrade}  ${S.of(context).single_grade}",
        type: S.of(context).single_grade,
        contentList: context.read<AddQuizCubit>().questionGrade,
        onSelected: (value) {
          setState(() {
            context.read<AddQuizCubit>().selectedQuestionGrade = value;
            context.read<AddQuizCubit>().finalDegree =
                value * context.read<AddQuizCubit>().selectedQuestionsCount;
          });
        },
      )*/SizedBox(),
    );
  }
}
