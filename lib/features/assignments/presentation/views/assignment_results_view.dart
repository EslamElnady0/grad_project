import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_results_view_body.dart';

class AssignmentResultsView extends StatelessWidget {
  const AssignmentResultsView({super.key});

  static const String routeName = '/assignment-Correction-View';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AssignmentResultsViewBody(),
    );
  }
}
