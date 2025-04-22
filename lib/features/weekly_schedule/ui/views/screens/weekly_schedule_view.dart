import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/weekly_schedule_view_body.dart';

class WeeklyScheduleView extends StatelessWidget {
  const WeeklyScheduleView({super.key});
static const String routeName = '/WeeklyScheduleView';
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      body: WeeklyScheduleViewBody(),
    );
  }
}
