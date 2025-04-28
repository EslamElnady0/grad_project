import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/annoucements/data/data%20sources/annoucements_remote_data_source.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_local_data_source.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_remote_data_source.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:grad_project/features/quizes/logic/quizzes_cubit/quizzes_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/question_list_widget.dart';
import '../../features/annoucements/data/data sources/annoucements_local_data_source.dart';
import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/lecture_manager/ui/cubit/file_upload_cubit.dart';
import '../data/data sources/all_courses_remote_data_source.dart';
import '../data/repos/all_courses_repo.dart';
import '../logic/all_courses_cubit/all_courses_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //toDo:--------------------------------Auth API --------------------
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //toDo:------------------------------ Annoucements API ------------------------------//
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
  //toDo:------------------------------ Courses API ------------------------------//    
  
  getIt.registerLazySingleton<AllCoursesRemoteDataSource>(
      () => AllCoursesRemoteDataSource(dio));
  getIt.registerLazySingleton<AllCoursesRepo>(() => AllCoursesRepo(
        remoteDataSource: getIt(),
      ));
  getIt.registerFactory<AllCoursesCubit>(() => AllCoursesCubit(getIt()));
  //toDo:------------------------------ Quiz UI ------------------------------//
  getIt.registerFactory<AddQuizCubit>(() => AddQuizCubit());
  getIt.registerFactory<QuestionListCubit>(() => QuestionListCubit());
  //toDo:------------------------------ Quiz Logic ----------------------------//
  getIt.registerLazySingleton<QuizzesRemoteDataSource>(
      () => QuizzesRemoteDataSource(dio));
  getIt.registerLazySingleton<QuizzesLocalDataSource>(
      () => QuizzesLocalDataSourceImpl());
  getIt.registerLazySingleton<QuizzesRepo>(
      () => QuizzesRepo(remoteDataSource: getIt(), localDataSource: getIt()));
  getIt.registerFactory<QuizzesCubit>(() => QuizzesCubit(getIt()));
  //toDo:------------------------------Ui------------------------------
  getIt.registerFactory<FileUploadCubit>(() => FileUploadCubit());
}
