import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/final_results_view_body.dart';

class FinalResultsView extends StatelessWidget {
  const FinalResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: FinalResultsViewBody(),
    );
  }
}
