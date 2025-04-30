import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_state.dart';
import 'package:grad_project/features/quizes/ui/widgets/title_and_drop_down_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class AssignmentDegreeWidget extends StatelessWidget {
  const AssignmentDegreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAssignmentCubit>();
    return Expanded(
      child: BlocBuilder<CreateAssignmentCubit, CreateAssignmentState>(
        builder: (context, state) {
          return TitleAndDropDownWidget<int>(
            title: S.of(context).assignment_degree,
            value:
                "${cubit.selectedAssignmentDegree}  ${S.of(context).single_grade}",
            type: S.of(context).single_grade,
            contentList: cubit.assignmentDegreeList,
            onSelected: (value) {
              cubit.selectAssignmentDegree(value);
            },
          );
        },
      ),
    );
  }
}
