import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import 'widgets/forum_view_body.dart';

class ForumViews extends StatelessWidget {
  const ForumViews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: const ForumViewsBody(),
    );
  }
}