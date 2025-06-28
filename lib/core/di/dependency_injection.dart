import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/cubits/socket_cubit/global_socket_cubit.dart';
import 'package:grad_project/core/data/data%20sources/get_course_materials_remote_data_source.dart';
import 'package:grad_project/core/data/repos/get_course_materials_repo.dart';
import 'package:grad_project/core/data/repos/socket_repo.dart';
import 'package:grad_project/core/lifecycle/app_lifecycle_cubit.dart';
import 'package:grad_project/core/logic/get_course_materials_cubit/get_course_materials_cubit.dart';
import 'package:grad_project/core/networking/network_monitor.dart';
import 'package:grad_project/features/annoucements/data/data%20sources/annoucements_remote_data_source.dart';
import 'package:grad_project/features/annoucements/data/repos/annoucements_repo.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/logic/delete_annoucement_cubit/delete_annoucement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/annoucements/logic/update_annoucement_cubit/update_annoucement_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/assign_grade_cubit/assign_grade_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/edit_assignment_cubit/edit_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignment_asnwer_status/get_assignment_answer_status_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_answers_cubit/get_assignments_answers_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_cubit.dart';
import 'package:grad_project/features/chat/logic/inner_chat_cubit/inner_chat_cubit.dart';
import 'package:grad_project/features/forum/data/data%20sources/questions_local_data_source.dart';
import 'package:grad_project/features/forum/data/data%20sources/questions_remote_data_source.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/question_and_answers/question_and_answers_cubit.dart';
import 'package:grad_project/features/forum/logic/toggle_like_cubit/toggle_like_cubit.dart';
import 'package:grad_project/features/chat/logic/get_group_details_cubit/get_group_details_cubit.dart';
import 'package:grad_project/features/chat/logic/get_latest_messages_cubit/get_latest_messages_cubit.dart';
import 'package:grad_project/features/subjects/data/data_source/subjects_remote_data_source.dart';
import 'package:grad_project/features/subjects/data/repos/add_materials_repo.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_local_data_source.dart';
import 'package:grad_project/features/assignments/data/data_sources/assignments_remote_data_source.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/assignment_upload_cubit.dart/assignment_upload_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/map/data/repos/halls_and_buildings_repo.dart';
import 'package:grad_project/features/map/presentation/view%20models/get_buildings_cubit/get_buildings_cubit.dart';
import 'package:grad_project/features/map/presentation/view%20models/get_halls_cubit/get_halls_cubit.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:grad_project/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:grad_project/features/profile/data/repos/profile_repo.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_cubit.dart';
import 'package:grad_project/features/profile/logic/get_profile_cubit/get_profile_cubit.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_local_data_source.dart';
import 'package:grad_project/features/quizes/data/data%20sources/quizzes_remote_data_source.dart';
import 'package:grad_project/features/quizes/data/repos/quizzes_repo.dart';
import 'package:grad_project/features/quizes/logic/delete_quiz_cubit/delete_quiz_cubit.dart';
import 'package:grad_project/features/quizes/logic/get_quizzes_cubit/get_quizzes_cubit.dart';
import 'package:grad_project/features/quizes/logic/quizzes_cubit/quizzes_cubit.dart';
import 'package:grad_project/features/quizes/logic/submit_quiz_cubit/submit_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/cubit/add_quiz_cubit/add_quiz_cubit.dart';
import 'package:grad_project/features/quizes/ui/widgets/question_list_widget.dart';
import 'package:grad_project/features/subjects/logic/add_materials/add_materials_cubit.dart';
import 'package:grad_project/features/subjects/logic/delete_course_material/delete_course_material_cubit.dart';
import 'package:grad_project/features/subjects/ui/manager/file_upload_cubit.dart';
import 'package:grad_project/features/subjects/ui/manager/subjects_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/activity_filter_cubit/activity_filter_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_assignments_cubit/get_students_assignments_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/get_students_quizzes_cubit/get_students_quizzes_cubit.dart';
import 'package:grad_project/features/time_schedule/logic/upload_assignment_solution_cubit/upload_assignment_solution_cubit.dart';
import 'package:grad_project/features/weekly_schedule/data/data%20sources/get_tabel_local_data_source.dart';
import 'package:grad_project/features/weekly_schedule/data/data%20sources/get_tabel_remote_data_source.dart';
import 'package:grad_project/features/weekly_schedule/data/repos/get_tabel_repo.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import '../../features/annoucements/data/data sources/annoucements_local_data_source.dart';
import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/logic/cubit/login_cubit.dart';
import '../../features/chat/data/data sources/chat_local_data_source.dart';
import '../../features/chat/data/data sources/chat_remote_data_source.dart';
import '../../features/chat/data/repos/chat_repo.dart';
import '../../features/map/data/data sources/building_and_halls_remote_data_source.dart';
import '../../features/map/data/data sources/map_remote_data_source.dart';
import '../../features/map/data/repos/map_repo.dart';
import '../../features/map/presentation/view models/map cubit/map_cubit.dart';
import '../../features/parking/data/data sources/parking_remote_data_source.dart';
import '../../features/parking/data/repos/parking_repo.dart';
import '../../features/parking/logic/parking_cubit/parking_cubit.dart';
import '../../features/quizes/logic/quiz_details_cubit/quiz_details_cubit.dart';
import '../../features/quizes/logic/student_quiz_answers_cubit/student_quiz_answers_cubit.dart';
import '../services/socket_service.dart';
import '../../features/chat/logic/chat_cubit/chat_cubit.dart';
import '../../features/quizes/logic/get_quiz_by_id_cubit/get_quiz_by_id_cubit.dart';
import '../../features/quizes/logic/start_students_quiz_cubit/start_students_quiz_cubit.dart';
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
  getIt.registerFactory<StartStudentsQuizCubit>(
      () => StartStudentsQuizCubit(getIt()));
  getIt.registerFactory<SubmitQuizCubit>(() => SubmitQuizCubit(getIt()));
  getIt.registerFactory<QuizDetailsCubit>(() => QuizDetailsCubit(getIt()));
  getIt.registerFactory<StudentQuizAnswersCubit>(
      () => StudentQuizAnswersCubit(getIt()));

  //toDo:------------------------------Subjects API------------------------------//
  getIt.registerLazySingleton<SubjectsRemoteDataSource>( () => SubjectsRemoteDataSource(dio));
  getIt.registerLazySingleton<SubjectsRepo>(() => SubjectsRepo(dio: dio, remoteDataSource: getIt()));
  getIt.registerFactory<AddMaterialsCubit>(() => AddMaterialsCubit(getIt()));
  getIt.registerFactory<DeleteCourseMaterialCubit>(() => DeleteCourseMaterialCubit(getIt()));
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
  //toDo:------------------------------ Assignments API ------------------------------//
  getIt.registerLazySingleton<AssignmentsRemoteDataSource>(
      () => AssignmentsRemoteDataSource(dio));
  getIt.registerLazySingleton<AssignmentsLocalDataSource>(
      () => AssignmentsLocalDataSourceImpl());
  getIt.registerLazySingleton<AssignmentsRepo>(() => AssignmentsRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<CreateAssignmentCubit>(
      () => CreateAssignmentCubit(getIt()));
  getIt.registerFactory<AssignmentUploadCubit>(() => AssignmentUploadCubit());
  getIt
      .registerFactory<GetAssignmentsCubit>(() => GetAssignmentsCubit(getIt()));
  getIt.registerFactory<GetStudentsAssignmentsCubit>(
      () => GetStudentsAssignmentsCubit(getIt()));
  getIt.registerFactory<UploadAssignmentSolutionCubit>(
      () => UploadAssignmentSolutionCubit(getIt()));
  getIt
      .registerFactory<EditAssignmentCubit>(() => EditAssignmentCubit(getIt()));
  getIt.registerFactory<GetAssignmentsAnswersCubit>(
      () => GetAssignmentsAnswersCubit(getIt()));

  getIt.registerFactory<AssignGradeCubit>(() => AssignGradeCubit(getIt()));
  getIt.registerFactory<GetAssignmentAnswerStatusCubit>(() => GetAssignmentAnswerStatusCubit(getIt()));
  //toDo:------------------------------ Questions API ------------------------------//
  getIt.registerLazySingleton<QuestionsRemoteDataSource>(
      () => QuestionsRemoteDataSource(dio));
  getIt.registerLazySingleton<QuestionsLocalDataSource>(
      () => QuestionsLocalDataSourceImpl());
  getIt.registerLazySingleton<QuestionsRepo>(() => QuestionsRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<GetAllQuestionsCubit>(
      () => GetAllQuestionsCubit(getIt()));
  getIt.registerFactory<ToggleLikeCubit>(() => ToggleLikeCubit(getIt()));
  getIt.registerFactory<QuestionAndAnswersCubit>(
      () => QuestionAndAnswersCubit(getIt()));
  //toDo:------------------------------ Chat API ------------------------------//
  getIt.registerLazySingleton<AppLifecycleCubit>(() => AppLifecycleCubit());
  getIt.registerLazySingleton<NetworkMonitor>(() => NetworkMonitor());
  getIt.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSource(dio));
  getIt.registerLazySingleton<SocketRepo>(() => SocketRepo(SocketService()));
  getIt.registerLazySingleton<SocketCubit>(
      () => SocketCubit(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl());

  // String token = await SharedPrefHelper.getSecuredString(Constants.token);
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      socketService: SocketService()));
  getIt.registerFactory<ChatGroupsCubit>(() => ChatGroupsCubit(getIt()));
  getIt.registerFactory<GetGroupDetailsCubit>(
      () => GetGroupDetailsCubit(getIt()));
  getIt.registerFactory<GetLatestMessagesCubit>(
      () => GetLatestMessagesCubit(getIt()));
  getIt.registerFactory<InnerChatCubit>(() => InnerChatCubit(getIt()));
  //toDo:------------------------------ Profile API ------------------------------//
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(dio));
  getIt.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerFactory<GetProfileCubit>(() => GetProfileCubit(getIt()));
  getIt.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(getIt()),
  );
  //toDo:------------------------------ Map API ------------------------------//
  getIt.registerLazySingleton<MapRemoteDataSource>(
      () => MapRemoteDataSource(dio));
  getIt.registerLazySingleton<MapRepo>(() => MapRepo(
      mapRemoteDataSource: getIt(),
      orsApiKey: "5b3ce3597851110001cf6248b9608669b259480a99bcc69f2180c468"));
  getIt.registerLazySingleton<BuildingAndHallsRemoteDataSource>(
      () => BuildingAndHallsRemoteDataSource(dio));
  getIt.registerLazySingleton<HallsAndBuildingsRepo>(
      () => HallsAndBuildingsRepo(getIt()));
  getIt.registerFactory<MapCubit>(() => MapCubit(getIt()));
  getIt.registerFactory<GetHallsCubit>(() => GetHallsCubit(getIt()));
  getIt.registerFactory<GetBuildingsCubit>(() => GetBuildingsCubit(getIt()));
  //toDo:------------------------------ Parking Logic ------------------------------//
  getIt.registerLazySingleton<ParkingRemoteDataSource>(
      () => ParkingRemoteDataSource(dio));
  getIt.registerLazySingleton<ParkingRepo>(
      () => ParkingRepo(remoteDataSource: getIt()));
  getIt.registerFactory<ParkingCubit>(() => ParkingCubit(getIt()));
  //toDo:***************************************************************************//
  //********************************* UI ***************************************//
  //toDo:***************************************************************************//
  //toDo:------------------------------ Quiz UI ------------------------------//
  getIt.registerFactory<AddQuizCubit>(() => AddQuizCubit());
  getIt.registerFactory<QuestionListCubit>(() => QuestionListCubit());
  getIt.registerFactory<GetStudentsQuizzesCubit>(
      () => GetStudentsQuizzesCubit(getIt()));
  //toDo:------------------------------Subjects Ui------------------------------
  getIt.registerLazySingleton<FileUploadCubit>(() => FileUploadCubit());
  getIt.registerFactory<SubjectsFilterCubit>(() => SubjectsFilterCubit());
  //toDo:------------------------------ Profile UI ------------------------------//
  getIt.registerFactory<AvatarUploadCubit>(() => AvatarUploadCubit());
  //toDo:------------------------------ Time Schedule UI ------------------------------//
  getIt.registerFactory<ActivityFilterCubit>(() => ActivityFilterCubit());
}
