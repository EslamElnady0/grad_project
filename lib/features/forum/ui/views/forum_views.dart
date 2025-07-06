import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/forum/ui/widgets/forum_view_body_bloc_builder.dart';

class ForumViews extends StatelessWidget {
  const ForumViews({super.key});
  static const String routeName = '/forumViews';
  @override
  Widget build(BuildContext context) {
    if (FlavorsFunctions.isStudent()) {
      return const Center(child: ForumViewBodyBlocBuilder());
    } else {
      return const CustomScaffold(
          body: Center(child: ForumViewBodyBlocBuilder()));
    }
  }
}
