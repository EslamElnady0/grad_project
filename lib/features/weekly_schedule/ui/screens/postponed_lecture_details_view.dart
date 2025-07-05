import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/weekly_schedule/data/models/get_table_response_model.dart';
import 'package:grad_project/features/weekly_schedule/ui/widgets/postponed_lecture_details_view_body.dart';


class PostponedLectureDetailsView extends StatelessWidget {
  final SessionResponse lecture;
  final Map<String, dynamic> postponedData;
static const String routeName = '/postponedLectureDetailsView';
  const PostponedLectureDetailsView({
    super.key,
    required this.lecture,
    required this.postponedData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.veryLightGray,

      body: PostponedLectureDetailsViewBody(lecture: lecture, postponedData: postponedData),
    );
  }
}
