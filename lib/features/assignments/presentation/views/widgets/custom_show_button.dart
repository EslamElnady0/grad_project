import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/assignments/presentation/views/pdf_web_view.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomShowButton extends StatelessWidget {
  const CustomShowButton({
    super.key,
    required this.fileUrl,
  });
  final String fileUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          PdfWebViewPage.routeName,
          extra: fileUrl,
        );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          gradient: Constants.secondaryGrad,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgsOpenInNew,
              ),
              hGap(8),
              Text(
                S.of(context).show,
                style: AppTextStyles.font12WhiteSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
