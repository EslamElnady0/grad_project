import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/localizationa.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/core/widgets/show_success_dialog.dart';
import 'package:grad_project/features/profile/data/models/update_profile_response_model.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_state.dart';
import 'package:translator/translator.dart';

class EditProfileBlocConsumer extends StatelessWidget {
  const EditProfileBlocConsumer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          updateProfileSuccess: (data) {
            UpdateProfileResponseModel responseData =
                data as UpdateProfileResponseModel;
            showSuccessDialogModified(
                context: context, message: responseData.message);
          },
          updateProfileFailure: (error) {
            showErrorDialog(context, error);
          },
        );
      },
      builder: (context, state) {
        return CustomModalProgress(
            isLoading: state is UpdateProfileLoading ? true : false,
            child: child);
      },
    );
  }
}

Future<void> showSuccessDialogModified({
  required BuildContext context,
  required String message,
}) async {
  if (!context.mounted) return;

  String displayText = message;

  if (isArabicLocale(context)) {
    try {
      // Attempt translation first
      final translator = GoogleTranslator();
      final translation =
          await translator.translate(message, from: 'en', to: 'ar');

      displayText = translation.text;
    } catch (e) {}
  }

  if (!context.mounted) return;

  // Show dialog once with final text
  await AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.bottomSlide,
    desc: displayText,
    descTextStyle: AppTextStyles.font14BlackSemiBold,
    showCloseIcon: false,
    btnOkOnPress: () => context.pop(), // Pop the EditProfileView route
  ).show();
}

bool isArabicLocale(BuildContext context) {
  final locale = Localizations.localeOf(context);
  return locale.languageCode == 'ar';
}
