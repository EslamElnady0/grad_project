import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/weekly_schedule_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeeklyScheduleBlocBuilder extends StatelessWidget {
  const WeeklyScheduleBlocBuilder({super.key});

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
      getTabelSuccess: (data) => WeeklyScheduleViewBody(
        tableResponseList: data.data, 
      ),
    getTabelFailure: (error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorDialog(
         context,
       error,
      doublePop: true,
        );
       
      });
      return const SizedBox.shrink();
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
