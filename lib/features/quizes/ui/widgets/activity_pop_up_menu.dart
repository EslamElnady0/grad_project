import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

class ActivityPopUpMenu extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  const ActivityPopUpMenu(
      {super.key, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      color: AppColors.darkblue,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: onEditPressed,
          child: Row(
            children: [
              const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).edit,
                style: AppTextStyles.font12WhiteMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: onDeletePressed,
          child: Row(
            children: [
              const Icon(
                Icons.delete,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).delete,
                style: AppTextStyles.font12WhiteMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
