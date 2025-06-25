import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/assignments/data/models/edit_assignment_request_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/data/repos/assignments_repo.dart';
import 'package:grad_project/features/assignments/logic/cubits/edit_assignment_cubit/edit_assignment_state.dart';
import 'package:intl/intl.dart';

class EditAssignmentCubit extends Cubit<EditAssignmentState> {
  final AssignmentsRepo _repo;
  EditAssignmentCubit(this._repo) : super(const EditAssignmentState.initial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int courseId = 0;
  int assignmentId = 0;
  String selectedDate = '';
  String selectedTime = '';
  File? uploadedFile;
  int assignmentDegree = 5;
  int selectedAssignmentDegree = 5;

  bool _isInitialized = false;

  void initializeFromModel(AssignmentModel model) {
    if (_isInitialized) return;

    assignmentId = model.id;
    titleController.text = model.title;
    descController.text = model.description;
    assignmentDegree = model.totalDegree;
    selectedAssignmentDegree = assignmentDegree;

    selectedDate =
        DateFormat('yyyy/MM/dd', 'en_US').format(DateTime.parse(model.date));

    final time = DateFormat('HH:mm', 'en_US').parse(model.time);
    selectedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';

    _isInitialized = true;

    emit(EditAssignmentState.selectedDegree(assignmentDegree.toString()));
    emit(EditAssignmentState.selectedDate(selectedDate));
    emit(EditAssignmentState.selectedTime(selectedTime));
  }

  Future<void> editAssignment() async {
    emit(const EditAssignmentState.editAssignmentLoading());

    final result = await _repo.editAssignment(EditAssignmentRequestModel(
        assignmentId: assignmentId,
        courseId: courseId,
        title: titleController.text,
        description: descController.text,
        totalDegree: assignmentDegree.toString(),
        date: selectedDate,
        time: selectedTime,
        file: uploadedFile));
    result.when(
      success: (data) {
        emit(EditAssignmentState.editAssignmentSuccess(data));
      },
      failure: (error) {
        emit(EditAssignmentState.editAssignmentFailure(error.getAllMessages()));
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
    emit(EditAssignmentState.selectedDegree(value.toString()));
  }

  void selectDate(DateTime date) {
    selectedDate = DateFormat('yyyy/MM/dd', 'en_US').format(date);
    emit(EditAssignmentState.selectedDate(selectedDate.toString()));
  }

  void selectTime(TimeOfDay time) {
    selectedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
    emit(EditAssignmentState.selectedTime(selectedTime.toString()));
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
