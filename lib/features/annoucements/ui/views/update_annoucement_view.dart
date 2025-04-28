import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/helpers/show_toast.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/annoucements/data/models/paginated_announcements_response.dart';
import 'package:grad_project/features/annoucements/data/models/update_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/logic/get_announcement_cubit/get_announcement_cubit.dart';
import 'package:grad_project/features/annoucements/logic/get_teacher_cources_cubit/get_teacher_cources_cubit.dart';
import 'package:grad_project/features/annoucements/logic/update_annoucement_cubit/update_annoucement_cubit.dart';
import 'package:provider/provider.dart';

import '../widgets/update_annoucement_view_body.dart';

class UpdateAnnoucementView extends StatelessWidget {
  static const routeName = "/update-annoucement-view";
  const UpdateAnnoucementView({super.key});

  @override
  Widget build(BuildContext context) {
    Announcement announcement =
        GoRouterState.of(context).extra! as Announcement;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UpdateAnnoucementCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAnnouncementCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetTeacherCourcesCubit>()..getTeacherCourses(),
        ),
      ],
      child: CustomScaffold(
        body: Provider.value(
            value: announcement,
            child: BlocConsumer<UpdateAnnoucementCubit, UpdateAnnoucementState>(
              listener: (context, state) {
                state.whenOrNull(updateAnnoucementFailure: (error) {
                  showErrorDialog(context, error);
                }, updateAnnoucementSuccess: (data) {
                  data as UpdateAnnoucementResponseBody;
                  showToast(toastMsg: data.message, state: ToastStates.success);
                  context.pop();
                });
              },
              builder: (context, state) {
                return CustomModalProgress(
                    isLoading: state is UpdateAnnoucementLoading,
                    child: const UpdateAnnoucementViewBody());
              },
            )),
      ),
    );
  }
}
