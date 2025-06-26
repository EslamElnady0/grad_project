import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/map/data/model/route_response.dart';
import 'package:grad_project/features/map/presentation/widgets/instructions_view_body.dart';

class InstructionsView extends StatelessWidget {
  static const routeName = '/instructions-view';
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as List<RouteInstruction>;
    return CustomScaffold(
      body: InstructionsViewBody(
        instructions: data,
      ),
    );
  }
}
