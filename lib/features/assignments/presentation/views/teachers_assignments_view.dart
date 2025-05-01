import 'package:flutter/widgets.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/Teachers_assignments_view_body.dart';

class TeachersAssignmentsView extends StatelessWidget {
  const TeachersAssignmentsView({super.key});

  static const String routeName = '/scheduled-assignments-view';
  @override
  Widget build(BuildContext context) {
    return const TeachersAssignmentsViewBody();
  }
}
