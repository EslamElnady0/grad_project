import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyScheduleCubit extends Cubit<Set<String>> {
  final List<String> days;
  WeeklyScheduleCubit(this.days) : super(days.toSet());
void updateDays(List<String> newDays) {
  emit(newDays.toSet());
}
  void toggleSelection(String day, String allDaysLabel) {
    final updatedSelection = Set<String>.from(state);

    if (day == allDaysLabel) {
      if (updatedSelection.length == days.length) {
        // updatedSelection.clear();
      } else {
        updatedSelection.addAll(days);
      }
    } else {
      if (updatedSelection.contains(day) && updatedSelection.length > 1) {
        updatedSelection.remove(day);
      } else {
        updatedSelection.add(day);
      }
    }
    emit(updatedSelection);
  }
}
