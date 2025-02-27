import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';

class CustomProfilePicture extends StatelessWidget {
  const CustomProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(Assets.imagesTestPicture),
          ),
          Positioned(
            top: -5,
            right: 10,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.darkblue,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    Assets.imagesSvgsEditPictureIcon,
                    width: 15,
                  ),
                ),
              ),
            ),
          )
        ]);
  }
}
