import 'package:flutter/material.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';

class FailureStateWidget extends StatefulWidget {
  final String errorMessage;
  final String? title;
  final IconData? icon;
  final VoidCallback? onRetry;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final EdgeInsets? padding;

  const FailureStateWidget({
    super.key,
    required this.errorMessage,
    this.title,
    this.icon,
    this.onRetry,
    this.iconColor,
    this.textColor,
    this.iconSize,
    this.padding,
  });

  @override
  State<FailureStateWidget> createState() => _FailureStateWidgetState();
}

class _FailureStateWidgetState extends State<FailureStateWidget>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _textController;
  late Animation<double> _iconAnimation;
  late Animation<double> _textAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Icon animation controller
    _iconController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Icon scale and fade animation
    _iconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _iconController,
      curve: Curves.elasticOut,
    ));

    // Text fade animation
    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    ));

    // Slide animation for the entire column
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() {
    _iconController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _textController.forward();
      }
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColorlight,
      onRefresh: () async {
        if (widget.onRetry != null) {
          widget.onRetry!();
        }
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: widget.padding ?? const EdgeInsets.all(24),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _textAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Icon
                  ScaleTransition(
                    scale: _iconAnimation,
                    child: FadeTransition(
                      opacity: _iconAnimation,
                      child: Icon(
                        widget.icon ?? Icons.error_outline,
                        size: widget.iconSize ?? 80,
                        color: widget.iconColor ?? AppColors.redlight,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title (if provided)
                  if (widget.title != null) ...[
                    FadeTransition(
                      opacity: _textAnimation,
                      child: Text(
                        widget.title!,
                        style: AppTextStyles.font18DarkblueBold.copyWith(
                          color: widget.textColor ?? AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Error Message
                  FadeTransition(
                    opacity: _textAnimation,
                    child: Text(
                      widget.errorMessage,
                      style: AppTextStyles.font14BlackMedium.copyWith(
                        color: widget.textColor ?? AppColors.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Retry Button (if onRetry is provided)
                  // if (widget.onRetry != null)
                  //   FadeTransition(
                  //     opacity: _textAnimation,
                  //     child: ElevatedButton.icon(
                  //       onPressed: widget.onRetry,
                  //       icon: const Icon(Icons.refresh, color: AppColors.white),
                  //       label: Text(
                  //         'Try Again',
                  //         style: AppTextStyles.font14WhiteSemiBold,
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: AppColors.primaryColorlight,
                  //         foregroundColor: AppColors.white,
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 24,
                  //           vertical: 12,
                  //         ),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
