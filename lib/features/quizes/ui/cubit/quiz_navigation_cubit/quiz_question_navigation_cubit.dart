import 'package:flutter_bloc/flutter_bloc.dart';

class QuizQuestionNavigatorCubit extends Cubit<int> {
  QuizQuestionNavigatorCubit() : super(0);

  void next(int maxIndex) {
    if (state < maxIndex - 1) emit(state + 1);
  }

  void previous() {
    if (state > 0) emit(state - 1);
  }

  void goTo(int index) => emit(index);
  void reset() => emit(0);
}
