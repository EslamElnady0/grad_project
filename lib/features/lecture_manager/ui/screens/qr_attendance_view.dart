import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/qr_attendance__view_body.dart';

class QrAttendanceView extends StatelessWidget {
  const QrAttendanceView({super.key});
  static const String routeName = '/qrAttendance';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body:QrAttendanceViewBody() ,
    );
  }
}
