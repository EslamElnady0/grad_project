import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../cubit/week_cubit.dart';
import '../widgets/add_lecture_view_body.dart';
    

class AddLectureView extends StatelessWidget {
  const AddLectureView({super.key});
  static const String routeName = '/addLectureView';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<WeekCubit>(), 
        child: const AddLectureViewBody(),
      ),
    );
  }
}
