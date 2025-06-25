import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/logic/all_courses_cubit/all_courses_cubit.dart';
import 'package:grad_project/features/subjects/ui/widgets/lecture_manager_view_body.dart';

class LectureManagerView extends StatelessWidget {
  const LectureManagerView({super.key});
  static const String routeName = '/lectureManager';
  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AllCoursesCubit>()..get();
    return BlocProvider.value(
      value: cubit,
      child: const LectureManagerViewBody(),
    );
  }
}
