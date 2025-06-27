import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/logic/cubits/assign_grade_cubit/assign_grade_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/assign_grade_cubit/assign_grade_state.dart';

class StudentDegreeDisplay extends StatefulWidget {
  const StudentDegreeDisplay({
    super.key,
    required this.answerId,
    required this.initialDegree,
  });

  final int answerId;
  final int initialDegree;

  @override
  State<StudentDegreeDisplay> createState() => _StudentDegreeDisplayState();
}

class _StudentDegreeDisplayState extends State<StudentDegreeDisplay> {
  late int currentDegree;

  @override
  void initState() {
    super.initState();
    currentDegree = widget.initialDegree;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AssignGradeCubit, AssignGradeState>(
      listener: (context, state) {
        if (state is AssignGradeSuccess && state.answerId == widget.answerId) {
          setState(() {
            currentDegree = state.newDegree;
          });
        }
      },
      child: SizedBox(
        width: 50,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '$currentDegree',
            style: AppTextStyles.font12DarkerBlueSemiBold,
          ),
        ),
      ),
    );
  }
}
