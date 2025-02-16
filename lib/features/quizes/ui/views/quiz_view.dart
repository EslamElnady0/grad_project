import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  static const String routeName = '/quiz-view';
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: QuizViewBody(),
    );
  }
}
