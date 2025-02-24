import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyScheduleCubit extends Cubit<Set<String>> {
  final List<String> days;
  WeeklyScheduleCubit(this.days) : super(days.toSet());

  void toggleSelection(String day, String allDaysLabel) {
    final updatedSelection = Set<String>.from(state);
    
    if (day == allDaysLabel) {
      if (updatedSelection.length == days.length) {
       // updatedSelection.clear();
      } else {
        updatedSelection.addAll(days);
      }
    } else {
      if (updatedSelection.contains(day)) {
        updatedSelection.remove(day);
      } else {
        updatedSelection.add(day);
      }
      
      if (updatedSelection.length == days.length) {
        updatedSelection.add(allDaysLabel);
      } else {
        updatedSelection.remove(allDaysLabel);
      }
    }
    emit(updatedSelection);
  }
}
