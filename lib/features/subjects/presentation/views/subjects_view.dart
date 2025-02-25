import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/subjects/presentation/manager/subjects_filter_cubit.dart';
import 'widgets/subjects_view_body.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubjectsFilterCubit(),
      child: const SubjectsViewBody(),
    );
  }
}
