import '../flavors/flavors_functions.dart';

class ApiConstants {
  static const String apiBaseUrl =
      "https://nextgenedu-database.azurewebsites.net/api/";
  static const String apiBaseUrlSecond =
      "https://ngu-question-hub.azurewebsites.net/";
  static const String mapBaseUrl = "https://api.openrouteservice.org/v2/";
  static String login =
      FlavorsFunctions.isStudent() ? "login" : "dashboard/login";
  static String table =
      FlavorsFunctions.isStudent() ? "table" : "teachers/table";
  static String courseMaterials = FlavorsFunctions.isStudent()
      ? "course-materials"
      : "teachers/course-materials";
  static const String dashboard = "dashboard";
  static const String announcements = "/announcements";
  static const String teachers = "teachers";
  static const String courses = "/courses";
  static const String stuCourses = "courses";
  static const String docCourses = "teachers/courses";
  static const String quizzes = "/quizzes";
  static const String questions = "questions";

  static const String assignments = "/assignments";
  static const String students = "/students";
  static const String questionLike = "qlike";
  static const String answerlike = "alike";
  static const String profile = "/profile";
  static const String update = "/update";
  static const String chatGroups = "/chat/group";
  static const String groupDetails = "/chat/group/detials";
  static const String messages = "/chat/messages";
  static const String oldMessages = "/chat/messages/old";
  static const String directions = "directions";
}
