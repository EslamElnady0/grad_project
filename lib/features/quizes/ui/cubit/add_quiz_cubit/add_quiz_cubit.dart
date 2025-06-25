import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_quiz_state.dart';
part 'add_quiz_cubit.freezed.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit() : super(const AddQuizState.initial());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    scrollController.dispose();
    return super.close();
  }

  int selectedTime = 5;
  int selectedQuestionGrade = 1;
  String? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;
  final List<int> timeList = [
    5,
    10,
    15,
    20,
  ];

  final List<int> questionGrade = [
    1,
    2,
    3,
    4,
  ];
}
