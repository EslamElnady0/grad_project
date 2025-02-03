import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.onSaved,
  });

  final String hintText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.textInputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscured,
      onSaved: widget.onSaved,
      keyboardType: widget.textInputType,
      textAlign: TextAlign.end,
      style: AppTextStyles.font10grayThin,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.font10grayThin,
        filled: true,
        fillColor: AppColors.white,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        prefixIcon: _buildPrefixIcon(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.textInputType == TextInputType.emailAddress) {
      return Icon(Icons.email_outlined, color: AppColors.gray);
    } else if (widget.textInputType == TextInputType.visiblePassword) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        child: Icon(Icons.lock_outline, color: AppColors.gray),
      );
    }
    return null;
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
