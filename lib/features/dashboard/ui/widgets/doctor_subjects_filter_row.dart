import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/dashboard/ui/widgets/custom_toggle_title_button.dart';

class DoctorSubjectsFilterRow extends StatelessWidget {
  const DoctorSubjectsFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12.w,
        children: List.generate(
            150,
            (int index) => const CustomToggleButton(
                  title: "data",
                )),
      ),
    );
  }
}
