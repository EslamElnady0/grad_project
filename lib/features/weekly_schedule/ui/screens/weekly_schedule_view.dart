import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_bloc_builder.dart';



class WeeklyScheduleView extends StatelessWidget {
  const WeeklyScheduleView({super.key});
  static const String routeName = '/WeeklyScheduleView';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
     
      body: BlocProvider.value(
        value: getIt<GetTabelCubit>()..getTable(),
        child:const WeeklyScheduleBlocBuilder(),
      ),
    );
  }
}
