import 'package:flutter/material.dart';

import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/add_lecture_view_body.dart';
    

class AddLectureView extends StatelessWidget {
  const AddLectureView({super.key});
  static const String routeName = '/addLectureView';
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body:  AddLectureViewBody(),
    );
  }
}
