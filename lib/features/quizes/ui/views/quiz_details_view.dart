import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/quiz_details_view_body.dart';

class QuizDetailsView extends StatelessWidget {
  static const String routeName = '/quiz_details';
  const QuizDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: QuizDetailsViewBody(),
    );
  }
}
