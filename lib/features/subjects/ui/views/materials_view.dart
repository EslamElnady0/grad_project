import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/logic/get_course_materials_cubit/get_course_materials_cubit.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/subjects/logic/delete_course_material/delete_course_material_cubit.dart';
import 'package:grad_project/features/subjects/ui/widgets/materials_view_body.dart';
import 'package:grad_project/generated/l10n.dart';

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
            create: (context) => getIt<DeleteCourseMaterialCubit>(),
          ),
        BlocProvider(
          create: (context) => MaterialsFilterCubit(),
        ),
        BlocProvider.value(
            value: getIt<GetCourseMaterialsCubit>()..get(courseId: courseId)),
      ],
      child:  CustomScaffold(
        body: BlocConsumer<DeleteCourseMaterialCubit, DeleteCourseMaterialState>(
          listener: (context, state) {
          
            if (state is DeleteCourseMaterialSuccess) {
              context.read<GetCourseMaterialsCubit>().get(courseId: courseId);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(
                  S.of(context).material_deleted_successfully,
                  style: AppTextStyles.font13WhiteBold                )),
              );
            } 
          },
          builder: (context, state) {
            return CustomModalProgress(
              isLoading:  state is DeleteCourseMaterialLoading,
              child: MaterialsViewBody(courseId: courseId));
          },
        ),
      ),
    );
  }
}
