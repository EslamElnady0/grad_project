import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Column(
        children: [
          CustomInnerScreensAppBar(
            title: S.of(context).profile,
          ),
          TitleTextWidget(
            text: S.of(context).profile_welcome_message,
          )
        ],
      ),
    );
  }
}
