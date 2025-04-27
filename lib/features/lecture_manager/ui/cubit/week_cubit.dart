import 'package:flutter_bloc/flutter_bloc.dart';

class WeekCubit extends Cubit<String> {
  WeekCubit(super.initialState);

  void selectWeek(String week) {
    emit(week);
  }
}