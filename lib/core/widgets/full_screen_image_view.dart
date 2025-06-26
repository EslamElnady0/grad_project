import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_cached_network_image.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/generated/l10n.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  static const String routeName = '/full-screen-image-view';
  const FullScreenImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          S.of(context).show_image,
          style: AppTextStyles.font16WhiteBold,
        ),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child:
            CustomCachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}
