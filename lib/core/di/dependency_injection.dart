import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/annoucements/data/data%20sources/annoucements_remote_data_source.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/lecture_manager/ui/cubit/week_cubit.dart';
import '../../features/annoucements/data/data sources/annoucements_local_data_source.dart';
import '../../features/lecture_manager/ui/cubit/file_upload_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  //------------------------------ Annoucements ------------------------------//
  getIt.registerLazySingleton<AnnoucementsRemoteDataSource>(
      () => AnnoucementsRemoteDataSource(dio));
  getIt.registerLazySingleton<AnnoucementsLocalDataSource>(
      () => AnnoucementsLocalDataSourceImpl());

  getIt.registerLazySingleton<AnnoucementsRepo>(() => AnnoucementsRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<GetTeacherCourcesCubit>(
      () => GetTeacherCourcesCubit(getIt()));
  getIt.registerFactory<AddAnnoucementsCubit>(
      () => AddAnnoucementsCubit(getIt(), getIt()));
  getIt.registerFactory<GetAnnouncementCubit>(
      () => GetAnnouncementCubit(getIt()));

  getIt.registerFactory<WeekCubit>(() => WeekCubit());
  getIt.registerFactory<FileUploadCubit>(() => FileUploadCubit());
}
