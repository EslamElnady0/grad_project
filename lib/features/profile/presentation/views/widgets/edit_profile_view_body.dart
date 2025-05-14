import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_cubit.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_state.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/editable_avatar.dart';
import 'package:grad_project/generated/l10n.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key, required this.currentAvatarUrl});

  final String? currentAvatarUrl;

  @override
  Widget build(BuildContext context) {
    final updateProfileCubit = context.read<UpdateProfileCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInnerScreensAppBar(
              title: S.of(context).edit_profile,
            ),
            vGap(30),
            BlocConsumer<AvatarUploadCubit, AvatarUploadState>(
                listener: (context, state) async {
              if (state is UploadSuccess) {
                updateProfileCubit.setAvatar(state.data.path);
              }
            }, builder: (context, state) {
              ImageProvider avatar;

              if (state is UploadSuccess) {
                avatar = FileImage(state.data);
                return EditableAvatar(avatar: avatar);
              }
              avatar = currentAvatarUrl != null
                  ? CachedNetworkImageProvider("https://$currentAvatarUrl",)
                  : const AssetImage(Assets.imagesTestPicture);
              return EditableAvatar(avatar: avatar);
            }),
            vGap(20),
            CustomTextFormField(
              hintText: S.of(context).enter_new_password,
              controller: updateProfileCubit.passwordController,
              textInputType: TextInputType.visiblePassword,
            ),
            vGap(20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: Constants.secondaryGrad,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                  onPressed: () {
                    updateProfileCubit.updateProfile();
                  },
                  child: Text(
                    S.of(context).confirm,
                    style: AppTextStyles.font13WhiteBold,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
