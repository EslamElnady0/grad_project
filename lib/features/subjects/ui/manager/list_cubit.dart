import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<String> {
  ListCubit(super.initialState);

  void selectWeek(String week) {
    emit(week);
  }
}