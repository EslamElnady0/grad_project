import '../flavors/flavors_functions.dart';

class ApiConstants {
  static const String apiBaseUrl ="https://nextgenedu-database.azurewebsites.net/api/";
static String login = FlavorsFunctions.isStudent() ? "login" : "dashboard/login";
  static const String dashboard = "dashboard";
  static const String announcements = "/announcements";
  static const String teachers = "teachers";
  static const String courses = "/courses";
}
