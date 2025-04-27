import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/show_toast.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';

class AddAnnouncementBlocConsumer extends StatelessWidget {
  final Widget child;
  const AddAnnouncementBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAnnoucementsCubit, AddAnnoucementsState>(
      listenWhen: (previous, current) {
        return current is AddAnnoucementsLoading ||
            current is AddAnnoucementsSuccess ||
            current is AddAnnoucementsFailure;
      },
      buildWhen: (previous, current) {
        return current is AddAnnoucementsLoading ||
            current is AddAnnoucementsSuccess ||
            current is AddAnnoucementsFailure;
      },
      listener: (context, state) {
        state.mapOrNull(
          addAnnoucementsSuccess: (data) {
            AddAnnouncementResponseBody responseData =
                data.data as AddAnnouncementResponseBody;
            showToast(
                toastMsg: responseData.message, state: ToastStates.success);
            context.pop();
          },
          addAnnoucementsFailure: (error) {
            showErrorDialog(context, error.error);
          },
        );
      },
      builder: (context, state) {
        return CustomModalProgress(
            isLoading: state is AddAnnoucementsLoading ? true : false,
            child: child);
      },
    );
  }
}
