import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_view_body.dart';

class WeeklyScheduleBlocBuilder extends StatelessWidget {
  const WeeklyScheduleBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTabelCubit, GetTabelState>(
  builder: (context, state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      getTabelLoading: () => const Center(child: CircularProgressIndicator()),
      getTabelSuccess: (data) => WeeklyScheduleViewBody(
        tableResponseList: data.data, // <-- data هنا من نوع GetTableResponseModel
      ),
      getTabelFailure: (error) => Center(child: Text(error)),
    );
  },
)
;
  }
}
