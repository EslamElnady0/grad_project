import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/logic/get_course_materials_cubit/get_course_materials_cubit.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/subjects/ui/widgets/materials_view_body.dart';

import '../manager/materials_filter_cubit.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key, required this.courseId});
  final int courseId;
  static const String routeName = '/materials';

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialsFilterCubit(),
        ),
        BlocProvider.value(
          value:  getIt<GetCourseMaterialsCubit>()..get(courseId: courseId)
        ),
      ],
      child: const CustomScaffold(
        body: MaterialsViewBody(),
      ),
    );
  }
}
