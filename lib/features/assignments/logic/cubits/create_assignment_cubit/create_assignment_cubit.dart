import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_request_model.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_state.dart';
import 'package:intl/intl.dart';

class CreateAssignmentCubit extends Cubit<CreateAssignmentState> {
  final AssignmentsRepo _repo;
  CreateAssignmentCubit(this._repo)
      : super(const CreateAssignmentState.initial());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  int courseId = 0;
  String selectedDate = '';
  String selectedTime = '';
 File? uploadedFile;
  int assignmentDegree = 5;
  int selectedAssignmentDegree = 5;
  Future<void> createAssignment() async {
    emit(const CreateAssignmentState.createAssignmentLoading());

    if (uploadedFile == null) {
      emit(const CreateAssignmentState.createAssignmentFailure('No file uploaded.'));
      return;
    }
    final result = await _repo.createAssignment(CreateAssignmentRequestModel(
        courseId: courseId,
        title: titleController.text,
        description: descController.text,
        totalDegree: assignmentDegree.toString(),
        date: selectedDate,
        time: selectedTime,
        file: uploadedFile!));
    result.when(
      success: (data) {
        emit(CreateAssignmentState.createAssignmentSuccess(data));
      },
      failure: (error) {
        emit(CreateAssignmentState.createAssignmentFailure(
            error.getAllMessages()));
      },
    );
  }

  List<int> assignmentDegreeList = [
    5,
    10,
    15,
    20,
  ];

  void selectAssignmentDegree(int value) {
    selectedAssignmentDegree = value;
    assignmentDegree = value;
    emit(CreateAssignmentState.selectedDegree(value.toString()));
  }

  void selectDate(DateTime date) {
    selectedDate = DateFormat('yyyy/MM/dd', 'en_US').format(date);
    emit(CreateAssignmentState.selectedDate(selectedDate.toString()));
  }

  void selectTime(TimeOfDay time) {
    selectedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
    emit(CreateAssignmentState.selectedTime(selectedTime.toString()));
  }

void setUploadedAssignment(PlatformFile platformFile) {
  uploadedFile = File(platformFile.path!);
}
  @override
  Future<void> close() {
    titleController.dispose();
    descController.dispose();
    return super.close();
  }
}
