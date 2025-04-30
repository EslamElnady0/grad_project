import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/List_cubit.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/file_upload_cubit.dart';

import '../widgets/add_lecture_view_body.dart';

class AddLectureView extends StatefulWidget {
  const AddLectureView({super.key});
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
        ],
        child: const AddLectureViewBody(),
      ),
    );
  }
}
