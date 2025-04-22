import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/forum/presentation/views/widgets/answers_view_body.dart';

import '../../../../core/widgets/text entry footer/text_entry_footer.dart';

class AnswersView extends StatelessWidget {
  const AnswersView({super.key});
  static const routeName = '/answers-view';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AnswersViewBody(),
      bottomNavigationBar: ChatViewFooter(),
    );
  }
}
