import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_cubit.dart';

class EditableAvatar extends StatelessWidget {
  const EditableAvatar({
    super.key,
    required this.avatar,
  });

  final ImageProvider avatar;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      CircleAvatar(
        radius: 100,
        backgroundImage: avatar,
      ),
      Positioned(
        top: 8,
        right: 15,
        child: Container(
          width: 30,
          decoration: const BoxDecoration(
            color: AppColors.backGround,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              context.read<AvatarUploadCubit>().uploadAvatar();
            },
            icon: SvgPicture.asset(
              Assets.imagesSvgsEditPictureIcon,
              width: 25,
            ),
            color: AppColors.redDark,
          ),
        ),
      )
    ]);
  }
}