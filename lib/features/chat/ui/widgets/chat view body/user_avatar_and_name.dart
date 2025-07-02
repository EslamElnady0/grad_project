import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/chat/data/models/get_messages_response.dart';
import '../../../../../core/theme/app_colors.dart';

class UserAvatarAndName extends StatelessWidget {
  final bool flag;
  final Sender sender;
  const UserAvatarAndName(
      {super.key, required this.flag, required this.sender});

  @override
  Widget build(BuildContext context) {
    final parts = sender.name.trim().split(RegExp(r'\s+'));
    final firstName = parts.isNotEmpty ? parts[0] : '';
    final secondInitial =
        parts.length > 1 && parts[1].isNotEmpty ? '${parts[1][0]}.' : '';
    final displayName = '$firstName $secondInitial';
    return flag
        ? Column(
            children: [
              Text(displayName,
                  textDirection: TextDirection.ltr,
                  style: AppTextStyles.font10GraySemiBold
                      .copyWith(color: AppColors.black)),
              vGap(4),
              CircleAvatar(
                radius: 18.r,
                child: ClipOval(
                  child: Image.network(
                    sender.avatar,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      Assets.imagesAvatarDoc,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
