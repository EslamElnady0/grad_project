import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/data/data%20sources/get_course_materials_remote_data_source.dart';
import 'package:grad_project/core/data/repos/get_course_materials_repo.dart';
import 'package:grad_project/core/logic/get_course_materials_cubit/get_course_materials_cubit.dart';
import 'package:grad_project/features/annoucements/data/data%20sources/annoucements_remote_data_source.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/logic/delete_annoucement_cubit/delete_annoucement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/annoucements/logic/update_annoucement_cubit/update_annoucement_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_cubit.dart';
import 'package:grad_project/features/lecture_manager/data/repos/add_materials_repo.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_local_data_source.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_remote_data_source.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_local_data_source.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_remote_data_source.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:grad_project/features/quizes/logic/delete_quiz_cubit/delete_quiz_cubit.dart';
import 'package:grad_project/features/quizes/logic/get_quizzes_cubit/get_quizzes_cubit.dart';
import 'package:grad_project/features/quizes/logic/quizzes_cubit/quizzes_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/question_list_widget.dart';
import 'package:grad_project/features/subjects/ui/manager/subjects_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/weekly_schedule/data/data%20sources/get_tabel_local_data_source.dart';
import 'package:grad_project/features/weekly_schedule/data/data%20sources/get_tabel_remote_data_source.dart';
import 'package:grad_project/features/weekly_schedule/data/repos/get_tabel_repo.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import '../../features/annoucements/data/data sources/annoucements_local_data_source.dart';
import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/lecture_manager/logic/add_materials_cubit/add_materials_cubit.dart';
import '../../features/lecture_manager/ui/cubit/file_upload_cubit.dart';
import '../../features/quizes/logic/get_quiz_by_id_cubit/get_quiz_by_id_cubit.dart';
import '../../features/quizes/logic/update_quiz_cubit/update_quiz_cubit.dart';
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
  getIt.registerFactory<GetCourcesToFilterCubit>(
      () => GetCourcesToFilterCubit(getIt()));
  getIt.registerFactory<AddAnnoucementsCubit>(
      () => AddAnnoucementsCubit(getIt(), getIt()));
  getIt.registerFactory<GetAnnouncementCubit>(
      () => GetAnnouncementCubit(getIt()));
  getIt.registerFactory<UpdateAnnoucementCubit>(
      () => UpdateAnnoucementCubit(getIt()));
  getIt.registerFactory<DeleteAnnoucementCubit>(
      () => DeleteAnnoucementCubit(getIt()));
  //toDo:------------------------------ Courses API ------------------------------//
  getIt.registerLazySingleton<AllCoursesRemoteDataSource>(
      () => AllCoursesRemoteDataSource(dio));
  getIt.registerLazySingleton<AllCoursesRepo>(() => AllCoursesRepo(
        remoteDataSource: getIt(),
      ));
  getIt.registerFactory<AllCoursesCubit>(() => AllCoursesCubit(getIt()));
  //toDo:------------------------------ Courses Materials ------------------------------//
  getIt.registerLazySingleton<GetCourseMaterialsRemoteDataSource>(
      () => GetCourseMaterialsRemoteDataSource(dio));
  getIt.registerLazySingleton<GetCourseMaterialsRepo>(
      () => GetCourseMaterialsRepo(remoteDataSource: getIt()));
  getIt.registerFactory<GetCourseMaterialsCubit>(
      () => GetCourseMaterialsCubit(getIt()));
  //toDo:------------------------------ Quiz Logic ----------------------------//
  getIt.registerLazySingleton<QuizzesRemoteDataSource>(
      () => QuizzesRemoteDataSource(dio));
  getIt.registerLazySingleton<QuizzesLocalDataSource>(
      () => QuizzesLocalDataSourceImpl());
  getIt.registerLazySingleton<QuizzesRepo>(
      () => QuizzesRepo(remoteDataSource: getIt(), localDataSource: getIt()));
  getIt.registerFactory<QuizzesCubit>(() => QuizzesCubit(getIt()));
  getIt.registerFactory<GetQuizzesCubit>(() => GetQuizzesCubit(getIt()));
  getIt.registerFactory<UpdateQuizCubit>(() => UpdateQuizCubit(getIt()));
  getIt.registerFactory<DeleteQuizCubit>(() => DeleteQuizCubit(getIt()));
  getIt.registerFactory<GetQuizByIdCubit>(() => GetQuizByIdCubit(getIt()));
  //toDo:------------------------------Add Materials------------------------------//
  getIt.registerLazySingleton<AddMaterialsRepo>(() => AddMaterialsRepo(dio));
  getIt.registerFactory<AddMaterialsCubit>(() => AddMaterialsCubit(getIt()));

  //toDo:------------------------------ Get Tabel Api ------------------------------//
  getIt.registerLazySingleton<GetTabelRemoteDataSource>(
      () => GetTabelRemoteDataSource(dio));
  getIt.registerLazySingleton<GetTabelLocalDataSource>(
      () => GetTabelLocalDataSourceImpl());
  getIt.registerLazySingleton<GetTabelRepo>(() => GetTabelRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<GetTabelCubit>(() => GetTabelCubit(getIt()));
  //toDo:***************************************************************************//
  //toDo:********************************* UI ***************************************//
  //toDo:***************************************************************************//
  //toDo:------------------------------ Quiz UI ------------------------------//
  getIt.registerFactory<AddQuizCubit>(() => AddQuizCubit());
  getIt.registerFactory<QuestionListCubit>(() => QuestionListCubit());
  getIt.registerFactory<GetStudentsQuizzesCubit>(() => GetStudentsQuizzesCubit(getIt()));
  //toDo:------------------------------Subjects Ui------------------------------
  getIt.registerLazySingleton<FileUploadCubit>(() => FileUploadCubit());
  getIt.registerFactory<SubjectsFilterCubit>(() => SubjectsFilterCubit());
  //toDo:------------------------------ Assignments API ------------------------------//
  getIt.registerLazySingleton<AssignmentsRemoteDataSource>(() => AssignmentsRemoteDataSource(dio));
  getIt.registerLazySingleton<AssignmentsLocalDataSource>(() => AssignmentsLocalDataSourceImpl());
  getIt.registerLazySingleton<AssignmentsRepo>(() => AssignmentsRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<CreateAssignmentCubit>(() => CreateAssignmentCubit(getIt()));
  getIt.registerFactory<AssignmentUploadCubit>(() => AssignmentUploadCubit());
  getIt.registerFactory<GetAssignmentsCubit>(() => GetAssignmentsCubit(getIt()));
  getIt.registerFactory<GetStudentsAssignmentsCubit>(() => GetStudentsAssignmentsCubit(getIt()));
}
