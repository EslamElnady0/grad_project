import 'package:bloc/bloc.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';

class WeeklyScheduleState {
  final TableResponse selectedTable;
  final Set<String> selectedDays;

  WeeklyScheduleState({
    required this.selectedTable,
    required this.selectedDays,
  });

  WeeklyScheduleState copyWith({
    TableResponse? selectedTable,
    Set<String>? selectedDays,
  }) {
    return WeeklyScheduleState(
      selectedTable: selectedTable ?? this.selectedTable,
      selectedDays: selectedDays ?? this.selectedDays,
    );
  }
}

class WeeklyScheduleCubit extends Cubit<WeeklyScheduleState> {
  final List<String> initialDays;

  WeeklyScheduleCubit(this.initialDays, TableResponse initialTable)
      : super(WeeklyScheduleState(
          selectedTable: initialTable,
          selectedDays: initialDays.toSet(),
        ));

  void updateTable(TableResponse newTable) {
    final newDays = newTable.sessions.values
        .expand((e) => e)
        .map((e) => e.day.trim().toLowerCase())
        .toSet();
    emit(state.copyWith(selectedTable: newTable, selectedDays: newDays));
  }

  void toggleSelection(String day, String allDaysLabel) {
    final updatedDays = Set<String>.from(state.selectedDays);
    if (day == allDaysLabel) {
      updatedDays.addAll(initialDays);
    } else if (updatedDays.contains(day) && updatedDays.length > 1) {
      updatedDays.remove(day);
    } else {
      updatedDays.add(day);
    }
    emit(state.copyWith(selectedDays: updatedDays));
  }
}
