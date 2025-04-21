import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/final_results/presentation/views/widgets/semester_header_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class YearHeaderWidget extends StatefulWidget {
  const YearHeaderWidget({
    super.key,
  });

  @override
  State<YearHeaderWidget> createState() => _YearHeaderWidgetState();
}

class _YearHeaderWidgetState extends State<YearHeaderWidget> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.darkblue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "العام الدراسي 2024 - 2025",
                style: AppTextStyles.font16WhiteSemiBold,
              ),
              hGap(15),
              GestureDetector(
                onTap: () {
                  isExpanded = !isExpanded;
                  setState(() {});
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    isExpanded
                        ? Assets.imagesSvgsArrowDown
                        : Assets.imagesSvgsArrowLeft,
                    width: isExpanded ? 22 : 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        vGap(15),
        if (isExpanded) ...[
          SemesterHeaderWidget(semester: S.of(context).semester_1),
          vGap(15),
          SemesterHeaderWidget(semester: S.of(context).semester_2),
        ],
      ],
    );
  }
}
