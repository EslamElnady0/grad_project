import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_view_body.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeeklyScheduleBlocBuilder extends StatelessWidget {
  const WeeklyScheduleBlocBuilder({super.key});

  Widget _buildFailureState(BuildContext context, String error) {
    return Center(
      child: FailureStateWidget(
        errorMessage: error,
        title: S.of(context).weeklySchedule,
        icon: Icons.calendar_today_outlined,
        onRetry: () {
          context.read<GetTabelCubit>().getTable();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTabelCubit, GetTabelState>(
  builder: (context, state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      getTabelLoading: () => Skeletonizer(
        child: WeeklyScheduleViewBody(
          tableResponseList: fakeData
        ),
      ),
      getTabelSuccess: (data) {
        if (data.data.isEmpty) {
          return Center(
            child: Text(
              'No schedule data available',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        return WeeklyScheduleViewBody(
          tableResponseList: data.data,
        );
      },
    getTabelFailure: (error) {
      return _buildFailureState(context, error);
    },
    );
  },
);
  }




  List<TableResponse> get fakeData {
    return [
          TableResponse(
            department: 'Loading...',
            departmentId: 0,
            semester: 0,
            sessions: {
              'Loading...': [
                SessionResponse(
                  id: 0,
                  type: 'Loading...',
                  course: 'Loading...',
                  hall: HallResponse( hallId: 0, hallName: '', hallCode: '', building: '', latitude: '', longitude: ''),
                  attendance: 'Loading...',
                  day: 'Loading...',
                  from: 'Loading...',
                  to: 'Loading...',
                  status: 'Loading...',
                ),
              ],
            },
          ),

        ];
  }
}
