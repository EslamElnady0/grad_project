import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/events/message%20events/messages_events.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/font_weight_helper.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/chat/logic/chat_cubit/chat_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ChatLevelsItem extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String? imageUrl;
  final bool isMyChat;
  const ChatLevelsItem(
      {super.key,
      required this.title,
      this.onTap,
      required this.isMyChat,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isMyChat ? AppColors.veryLightCyan : AppColors.backGround,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                  color: isMyChat ? AppColors.primaryColordark : AppColors.gray,
                  width: 2),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundImage: imageUrl != null
                      ? NetworkImage(imageUrl!)
                      : const AssetImage(Assets.imagesAvatarDoc),
                ),
                hGap(15),
                SizedBox(
                  width: context.width * 0.5,
                  child: Text(
                    title,
                    style: AppTextStyles.font20DarkerBlueBold.copyWith(
                        fontWeight: isMyChat
                            ? FontWeightHelper.bold
                            : FontWeightHelper.semiBold,
                        color: isMyChat
                            ? AppColors.primaryColordark
                            : AppColors.darkerBlue),
                  ),
                ),
                const Spacer(),
                !isMyChat
                    ? const Icon(Icons.lock, color: AppColors.darkerBlue)
                    : StreamBuilder<UnSeenMessagesEvent>(
                        stream: context
                            .read<ChatGroupsCubit>()
                            .unSeenMessagesStream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }
                          final data = snapshot.data!;
                          return data.count != 0
                              ? CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: AppColors.primaryColordark,
                                  child: Text(
                                    data.count.toString(),
                                    style: AppTextStyles.font12WhiteSemiBold
                                        .copyWith(
                                      fontWeight: FontWeightHelper.bold,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      )
              ],
            ),
          ),
        ));
  }
}
