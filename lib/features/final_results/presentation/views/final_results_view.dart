import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/final_results_view_body.dart';

class FinalResultsView extends StatelessWidget {
  const FinalResultsView({super.key});
  static const String routeName = '/final-results-view';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: FinalResultsViewBody(),
    );
  }
}
