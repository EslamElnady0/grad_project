import 'package:flutter/widgets.dart';
import 'package:grad_project/features/lecture_manager/ui/widgets/lecture_manager_view_body.dart';

class LectureManagerView extends StatelessWidget {
  const LectureManagerView({super.key});
  static const String routeName = '/lectureManager';
  @override
  Widget build(BuildContext context) {
    return const LectureManagerViewBody();
  }
}
