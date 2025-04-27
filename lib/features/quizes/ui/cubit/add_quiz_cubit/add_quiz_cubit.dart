import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_quiz_state.dart';
part 'add_quiz_cubit.freezed.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit() : super(const AddQuizState.initial());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
