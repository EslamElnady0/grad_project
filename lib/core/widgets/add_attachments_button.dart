import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';

class ChatAddAttachmentsButton extends StatefulWidget {
  const ChatAddAttachmentsButton({super.key});

  @override
  State<ChatAddAttachmentsButton> createState() =>
      _ChatAddAttachmentsButtonState();
}

class _ChatAddAttachmentsButtonState extends State<ChatAddAttachmentsButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Static part
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.darkerBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Transform.rotate(
              angle: isPressed ? 3.14 / 4 : 0,
              child: SvgPicture.asset(
                Assets.imagesSvgsAddIcon,
                height: 20.h,
              ),
            ),
          ),
          // Dynamic part
          Positioned(
            bottom: 50.h,
            child: AnimatedContainer(
              height: isPressed ? 100.h : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.darkerBlue,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AnimatedScale(
                      scale: isPressed ? 1 : 0, // Scale from 0 to 1
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: SvgIconButton(
                        iconPath: Assets.imagesSvgsFilesIcon,
                        height: 22.h,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  vGap(10),
                  Expanded(
                    child: AnimatedScale(
                      scale: isPressed ? 1 : 0, // Scale from 0 to 1
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: SvgIconButton(
                        iconPath: Assets.imagesSvgsPicturesIcon,
                        height: 22.h,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
