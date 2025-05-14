import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/profile/logic/avatar_upload_cubit/avatar_upload_cubit.dart';
import 'package:grad_project/features/profile/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/edit_profile_bloc_consumer.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static const String routeName = '/edit-profile-view';
  @override
  Widget build(BuildContext context) {
    final String? currentAvatarUrl = GoRouterState.of(context).extra as String?;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UpdateProfileCubit>()),
        BlocProvider(create: (context) => getIt<AvatarUploadCubit>())
      ],
      child: CustomScaffold(
        body: EditProfileBlocConsumer(
          child: EditProfileViewBody(
            currentAvatarUrl: currentAvatarUrl,
          ),
        ),
      ),
    );
  }
}
