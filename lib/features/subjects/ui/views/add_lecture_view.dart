import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/models/get_course_materials_response_model.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/subjects/logic/add_materials/add_materials_cubit.dart';
import 'package:grad_project/features/subjects/ui/manager/file_upload_cubit.dart';
import 'package:grad_project/features/subjects/ui/manager/list_cubit.dart';

import '../widgets/add_lecture_view_body.dart';

class AddLectureView extends StatefulWidget {
  const AddLectureView({
    super.key, 
    required this.id,
    this.isEdit = false,
    this.materialModel,
  });

  final int id;
  final bool isEdit;
  final CourseMaterialData? materialModel;

  static const String routeName = '/addLectureView';

  @override
  State<AddLectureView> createState() => _AddLectureViewState();
}

class _AddLectureViewState extends State<AddLectureView> {
  @override
  void initState() {
    getIt.unregister<FileUploadCubit>();
    getIt.registerLazySingleton<FileUploadCubit>(() => FileUploadCubit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ListCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<FileUploadCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<AddMaterialsCubit>(),
          ),
        ],
        child: AddLectureViewBody(
          id: widget.id,
          isEdit: widget.isEdit,
          materialModel: widget.materialModel,
        ),
      ),
    );
  }
}
