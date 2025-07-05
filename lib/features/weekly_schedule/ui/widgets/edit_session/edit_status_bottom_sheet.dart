import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/logic/get_tabel_cubit/get_tabel_cubit.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/edit_session/edit_session_form.dart';

void editStatusBottomSheet(SessionResponse lecture, BuildContext context) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: EditSessionForm(lecture: lecture),
    ),
  );

  // If the session was updated successfully, refresh the table
  if (result == true) {
    try {
      context.read<GetTabelCubit>().getTable();
    } catch (e) {
      // If GetTabelCubit is not available in this context, we can ignore it
      print('Could not refresh table from this context: $e');
    }
  }
}

