import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/week_cubit.dart';
import '../networking/api_service.dart';
import '../../features/lecture_manager/ui/cubit/file_upload_cubit.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
    // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerFactory<WeekCubit>(() => WeekCubit());
  getIt.registerFactory<FileUploadCubit>(() => FileUploadCubit());
} 
