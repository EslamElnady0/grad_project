import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/assignment_details_view_body.dart';

class AssignmentDetailsView extends StatelessWidget {
  const AssignmentDetailsView({super.key});

  static const routeName = '/assignment-details';

  @override
  Widget build(BuildContext context) {
    final dynamic assignmentModel = GoRouterState.of(context).extra;
    return CustomScaffold(
      body: AssignmentDetailsViewBody(
        assignmentModel: assignmentModel,
      ),
    );
  }
}
