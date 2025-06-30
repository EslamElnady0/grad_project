import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:grad_project/features/forum/data/repos/questions_repo.dart';

class DeleteContentService {
  final QuestionsRepo _questionsRepo;

  DeleteContentService(this._questionsRepo);

  /// Helper method to check if user can delete content
  /// Returns true if admin or if student and owns the content
  Future<bool> canDeleteContent(String ownerId) async {
    if (FlavorsFunctions.isAdmin()) {
      return true;
    }
    if (FlavorsFunctions.isStudent()) {
      final currentUserId = await SharedPrefHelper.getString(Constants.userId);
      return currentUserId == ownerId;
    }
    return false;
  }

  /// Shows a SnackBar with the given message using the forum's style
  void _showSnackBar(BuildContext context, String message, {bool isSuccess = true}) {
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.font16WhiteSemiBold,
        ),
        backgroundColor: isSuccess ? AppColors.darkblue : AppColors.redDark,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Checks if the current user has permission to delete the content
  Future<bool> _hasDeletePermission(String ownerId) async {
    if (FlavorsFunctions.isAdmin()) {
      return true;
    }
    
    if (FlavorsFunctions.isStudent()) {
      final currentUserId = await SharedPrefHelper.getString(Constants.userId);
      return currentUserId == ownerId;
    }
    
    return false;
  }

  /// Deletes a question after checking permissions
  Future<void> deleteQuestion({
    required BuildContext context,
    required String questionId,
    required String ownerId,
    VoidCallback? onSuccess,
  }) async {
    // Check permissions first
    final hasPermission = await _hasDeletePermission(ownerId);
    
    if (!hasPermission) {
      _showSnackBar(
        context,
        S.of(context).you_can_only_delete_your_own_content,
        isSuccess: false,
      );
      return;
    }

    try {
      final result = await _questionsRepo.deleteQuestion(
        questionId: questionId,
        ownerId: ownerId,
      );

      result.when(
        success: (data) {
          _showSnackBar(
            context,
            S.of(context).deleted_successfully,
          );
          // Call the success callback to refresh UI
          onSuccess?.call();
        },
        failure: (error) {
          _showSnackBar(
            context,
            error.getAllMessages(),
            isSuccess: false,
          );
        },
      );
    } catch (e) {
      _showSnackBar(
        context,
        'An error occurred while deleting the question',
        isSuccess: false,
      );
    }
  }

  /// Deletes an answer after checking permissions
  Future<void> deleteAnswer({
    required BuildContext context,
    required String answerId,
    required String ownerId,
    VoidCallback? onSuccess,
  }) async {
    // Check permissions first
    final hasPermission = await _hasDeletePermission(ownerId);
    
    if (!hasPermission) {
      _showSnackBar(
        context,
        S.of(context).you_can_only_delete_your_own_content,
        isSuccess: false,
      );
      return;
    }

    try {
      final result = await _questionsRepo.deleteAnswer(
        answerId: answerId,
        ownerId: ownerId,
      );

      result.when(
        success: (data) {
          _showSnackBar(
            context,
            S.of(context).deleted_successfully,
          );
          // Call the success callback to refresh UI
          onSuccess?.call();
        },
        failure: (error) {
          _showSnackBar(
            context,
            error.getAllMessages(),
            isSuccess: false,
          );
        },
      );
    } catch (e) {
      _showSnackBar(
        context,
        'An error occurred while deleting the answer',
        isSuccess: false,
      );
    }
  }
}
