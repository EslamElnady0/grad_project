import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/edit_assignment_view_body.dart';

class EditAssignmentView extends StatelessWidget {
  const EditAssignmentView({super.key});

  static const String routeName = '/edit-assignment';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: EditAssignmentViewBody(),
    );
  }
}
