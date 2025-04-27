import 'package:flutter/material.dart';
import 'package:grad_project/features/quizes/ui/widgets/drop_down_widget.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class TitleAndDropDownWidget<T> extends StatelessWidget {
  final String title;
  final String value;
  final List<T> contentList;
  final dynamic Function(T)? onSelected;
  const TitleAndDropDownWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.contentList,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font14BlackBold
              .copyWith(color: AppColors.darkerBlue),
        ),
        vGap(10),
        DropDownWidget<T>(
            value: value, contentList: contentList, onSelected: onSelected),
      ],
    );
  }
}
