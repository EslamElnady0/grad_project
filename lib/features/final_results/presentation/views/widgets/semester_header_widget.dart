import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class SemesterHeaderWidget extends StatefulWidget {
  const SemesterHeaderWidget({super.key, required this.semester});
  final String semester;
  @override
  State<SemesterHeaderWidget> createState() => _SemesterHeaderWidgetState();
}

class _SemesterHeaderWidgetState extends State<SemesterHeaderWidget> {
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.semester,
                style: AppTextStyles.font16DarkerBlueSemiBold,
              ),
              hGap(36),
              GestureDetector(
                onTap: () {
                  isExpanded = !isExpanded;
                  setState(() {});
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    color: AppColors.darkblue,
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
      ],
    );
  }
}