import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:grad_project/core/flavors/flavers_const.dart';
import 'package:grad_project/core/flavors/flavor_model.dart';

class FlavorsFunctions {
  static void setupStudentsFlover() {
  floverModel(
    name:FlaversConst.student,
    apiUrl: "https://api.student.com",
  );
}
static void setupAdminFlover() {
  floverModel(
    name: FlaversConst.admin,
    apiUrl: "https://api.admin.com",
  );
}
  static bool isAdmin() {
    return FlavorConfig.instance.name == FlaversConst.admin;
  }

  static bool isStudent() {
    return FlavorConfig.instance.name == FlaversConst.student;
  }
  static String get apiUrl {
    return FlavorConfig.instance.variables[FlaversConst.apiurl] ?? "";
  }
}
