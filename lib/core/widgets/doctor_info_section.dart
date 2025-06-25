import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

import '../helpers/app_assets.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key, required this.name, required this.specialization, this.imageUrl});
final String name;
final String specialization;
final String? imageUrl ;
  @override
  Widget build(BuildContext context) {
    return Row(
  children: [
    CircleAvatar(
      radius: 20.r,
      backgroundImage: imageUrl == null
          ? const AssetImage(Assets.imagesAvatarDoc)
          : CachedNetworkImageProvider(imageUrl!) as ImageProvider,
    ),
    hGap(8),
    Expanded( // 👈 الحل هنا
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.font13BlackSemiBold,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            specialization,
            style: AppTextStyles.font9GrayMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    ),
  ],
)
;
  }
}
