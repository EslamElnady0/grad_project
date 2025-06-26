import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/profile/logic/get_profile_cubit/get_profile_cubit.dart';
import 'package:grad_project/features/profile/logic/get_profile_cubit/get_profile_state.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<GetProfileCubit>()..getProfile(),
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProfileFailure) {
              print(state.error);
              return Center(child: Text(state.error));
            } else if (state is GetProfileSuccess) {
              return ProfileViewBody(profileModel: state.data.data,);
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}
