import 'package:get_it/get_it.dart';

import 'package:grad_project/features/lecture_manager/ui/cubit/week_cubit.dart';

import '../../features/lecture_manager/ui/cubit/file_upload_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<WeekCubit>(() => WeekCubit());
  getIt.registerFactory<FileUploadCubit>(() => FileUploadCubit());
}
