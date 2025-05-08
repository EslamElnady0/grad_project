import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/forum_view_body.dart';

class ForumViewBodyBlocBuilder extends StatelessWidget {
  const ForumViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider.value(
      value: getIt<GetAllQuestionsCubit>()..getAllQuestions(),
      child: const ForumViewsBody(),
    );
  }
}