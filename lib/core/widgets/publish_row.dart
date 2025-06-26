import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_text_styles.dart';
import 'custom_red_grad_container.dart';
import '../../generated/l10n.dart';

class PublishRow extends StatelessWidget {
  final VoidCallback onTap;
  const PublishRow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 1,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomRedGradContainer(
            alignment: Alignment.center,
            raduis: 12,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 26.w),
            child: Text(
              S.of(context).publish,
              style: AppTextStyles.font13WhiteBold,
            ),
          ),
        )
      ],
    );
  }
}
