import 'package:flutter/widgets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_manager_item.dart';

class AssignmentManagerItemListView extends StatelessWidget {
  const AssignmentManagerItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      itemBuilder: (context, index) {
        return const AssignmentManagerItem();
      },
      separatorBuilder: (context, index) => vGap(10),
    );
  }
}
