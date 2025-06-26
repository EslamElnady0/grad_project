import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class TypingIndicatorWidget extends StatefulWidget {
  final bool isVisible;
  final String userName;
  final String type; // "text" or "record"

  const TypingIndicatorWidget({
    super.key,
    required this.isVisible,
    required this.userName,
    required this.type,
  });

  @override
  State<TypingIndicatorWidget> createState() => _TypingIndicatorWidgetState();
}

class _TypingIndicatorWidgetState extends State<TypingIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _dotController;
  late AnimationController _glowController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _dotController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));

    _dotController.repeat();
    _glowController.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(TypingIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible) {
      _slideController.forward();
    } else if (!widget.isVisible && oldWidget.isVisible) {
      _slideController.reverse();
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _dotController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gray.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.type == "text"
                              ? '${widget.userName} is typing'
                              : '${widget.userName} is recording',
                          style: AppTextStyles.font12GraySemiBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        widget.type == "text"
                            ? _buildAnimatedDots()
                            : _buildGlowingMicrophone(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedDots() {
    return AnimatedBuilder(
      animation: _dotController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final delay = index * 0.2;
            final animationValue = (_dotController.value + delay) % 1.0;
            final opacity = (animationValue * 2).clamp(0.0, 1.0);

            return Container(
              margin: EdgeInsets.only(right: 2.w),
              child: Opacity(
                opacity: opacity,
                child: Container(
                  width: 4.w,
                  height: 4.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildGlowingMicrophone() {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, child) {
        return Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(_glowAnimation.value),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(_glowAnimation.value * 0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.mic,
            color: Colors.white,
            size: 10.w,
          ),
        );
      },
    );
  }
}
