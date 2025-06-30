import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/features/forum/logic/add_question/add_question_cubit.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:grad_project/core/helpers/spacing.dart';

class AddQuestionBottomSheet extends StatefulWidget {
  final VoidCallback? onQuestionAdded;
  
  const AddQuestionBottomSheet({super.key, this.onQuestionAdded});

  @override
  State<AddQuestionBottomSheet> createState() => _AddQuestionBottomSheetState();
}

class _AddQuestionBottomSheetState extends State<AddQuestionBottomSheet> {
  final TextEditingController _questionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  String? _base64Image;

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      
      if (image != null) {
        final bytes = await image.readAsBytes();
        final base64String = base64Encode(bytes);
        
        setState(() {
          _selectedImage = image;
          _base64Image = base64String;
        });
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _base64Image = null;
    });
  }

  void _submitQuestion() {
    final questionText = _questionController.text.trim();
    
    if (questionText.isEmpty) {
      showErrorDialog(context, S.of(context).enterQuestionBodyFirst);
      return;
    }
    String? fullBase64Image; 
    if (_base64Image != null && _base64Image!.isNotEmpty) {
      fullBase64Image = "data:image/png;base64,$_base64Image";
    }
    context.read<AddQuestionCubit>().addQuestion(
      body: questionText,
      image: fullBase64Image,
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.gray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          vGap(16),
          
          // Title
          Text(
            S.of(context).add_your_question,
            style: AppTextStyles.font18DarkblueBold,
          ),
          vGap(16),
          
          // Question input field
          TextField(
            controller: _questionController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: S.of(context).add_your_question,
              hintStyle: AppTextStyles.font14GrayMedium,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.gray.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.primaryColorlight),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
          vGap(16),
          
          // Image section
          Row(
            children: [
              // Pick image button
              IconButton(
                onPressed: _pickImage,
                icon: const Icon(Icons.image, color: AppColors.primaryColorlight),
                tooltip: S.of(context).images,
              ),
              hGap(8),
              
              // Image preview or text
              Expanded(
                child: _selectedImage != null
                    ? Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.gray.withOpacity(0.3)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                File(_selectedImage!.path),
                                width: double.infinity,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: _removeImage,
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: AppColors.redlight,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        S.of(context).images,
                        style: AppTextStyles.font14GrayMedium,
                      ),
              ),
            ],
          ),
          vGap(24),
          
          // Submit button with bloc listener
          BlocConsumer<AddQuestionCubit, AddQuestionState>(
            listener: (context, state) {
              if (state is AddQuestionSuccess) {
                // Call the callback function if provided
                if (widget.onQuestionAdded != null) {
                  widget.onQuestionAdded!();
                } else {
                  Navigator.of(context).pop(true); // Fallback behavior
                }
              } else if (state is AddQuestionFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return CustomTextAndIconButton(
                text: state is AddQuestionLoading 
                    ? S.of(context).loading
                    : S.of(context).add_to_send,
                primaryButton: true,
                icon: state is AddQuestionLoading 
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                        ),
                      )
                    : const Icon(Icons.send, color: AppColors.white),
                onTap: state is AddQuestionLoading ? () {} : _submitQuestion,
              );
            },
          ),
          
          // Add bottom padding for safe area
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16.h),
        ],
      ),
    );
  }
}
