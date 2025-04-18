import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/time_schedule/presentation/views/widgets/time_schedule_view_body.dart';

class TimeScheduleView extends StatelessWidget {
  const TimeScheduleView({super.key});
static const String routeName = '/Time-Schedule-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: TimeScheduleViewBody(),
    );
  }
}
