import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/svg_icon_button.dart';
import 'package:grad_project/features/chat/ui/cubit/file_picker_cubit.dart';

class ChatAddAttachmentsButton extends StatefulWidget {
  const ChatAddAttachmentsButton({super.key});

  @override
  State<ChatAddAttachmentsButton> createState() =>
      _ChatAddAttachmentsButtonState();
}

class _ChatAddAttachmentsButtonState extends State<ChatAddAttachmentsButton> {
  OverlayEntry? _overlayEntry;
  bool isMenuVisible = false;

  final LayerLink _layerLink = LayerLink();

  void _toggleMenu(BuildContext parentContext) {
    if (isMenuVisible) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() => isMenuVisible = false);
    } else {
      _overlayEntry = _createOverlayEntry(parentContext);
      Overlay.of(parentContext).insert(_overlayEntry!);
      setState(() => isMenuVisible = true);
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext parentContext) {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Stack(
          children: [
            // Optional: tap outside to close
            GestureDetector(
              onTap: () {
                _toggleMenu(parentContext);
              },
              behavior: HitTestBehavior.translucent,
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(isArabicLocale(context) ? -8 : 0, -90.h),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.darkerBlue,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIconButton(
                        iconPath: Assets.imagesSvgsFilesIcon,
                        height: 22.h,
                        onPressed: () {
                          parentContext
                              .read<FilePickerCubit>()
                              .pickFiles(parentContext);
                          _toggleMenu(parentContext);
                        },
                      ),
                      vGap(12),
                      SvgIconButton(
                        iconPath: Assets.imagesSvgsPicturesIcon,
                        height: 22.h,
                        onPressed: () {
                          parentContext
                              .read<FilePickerCubit>()
                              .pickImages(parentContext);
                          _toggleMenu(parentContext);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          _toggleMenu(context);
        },
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.darkerBlue,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Transform.rotate(
            angle: isMenuVisible ? 3.14 / 4 : 0,
            child: SvgPicture.asset(
              Assets.imagesSvgsAddIcon,
              height: 20.h,
            ),
          ),
        ),
      ),
    );
  }
}
