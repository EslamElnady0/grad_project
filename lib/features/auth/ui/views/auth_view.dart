import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:grad_project/features/auth/logic/cubit/login_state.dart';
import 'package:grad_project/features/home/ui/views/home_view.dart';

import '../../../../core/widgets/show_error_dialog.dart';
import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (apiErrorModel) {
                 showErrorDialog(context, apiErrorModel);
              },
              success: (registerResponse) {
                 GoRouter.of(context).go(HomeView.routeName);
              },
            );
          },
          builder: (context, state) {
            return CustomModalProgress(
              isLoading: state is Loading ? true : false,
              child: const AuthViewBody(),
            );
          },
        ),
      ),
    );
  }
}
