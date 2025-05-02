import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import '../../data/models/get_quizzes_response.dart';
import '../widgets/quiz_details_view_body.dart';

class QuizDetailsView extends StatelessWidget {
  static const String routeName = '/quiz_details';
  const QuizDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizModel quizModel = GoRouterState.of(context).extra as QuizModel;
    return CustomScaffold(
      body: Provider.value(
        value: quizModel,
        child: const QuizDetailsViewBody(),
      ),
    );
  }
}
