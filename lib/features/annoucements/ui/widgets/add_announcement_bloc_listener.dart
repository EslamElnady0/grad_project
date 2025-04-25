import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/show_toast.dart';
import 'package:grad_project/core/widgets/show_loading_dialog.dart';
import 'package:grad_project/features/annoucements/data/models/add_annoucement_response_body.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';

class AddAnnouncementBlocListener extends StatelessWidget {
  const AddAnnouncementBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAnnoucementsCubit, AddAnnoucementsState>(
      listenWhen: (previous, current) {
        return current is AddAnnoucementsLoading ||
            current is AddAnnoucementsSuccess ||
            current is AddAnnoucementsFailure;
      },
      listener: (context, state) {
        state.mapOrNull(
          addAnnoucementsLoading: (_) {
            showLoadingDialog(context);
          },
          addAnnoucementsSuccess: (data) {
            AddAnnouncementResponseBody responseData =
                data.data as AddAnnouncementResponseBody;
            context.pop();
            showToast(
                toastMsg: responseData.message, state: ToastStates.success);
            context.pop();
          },
          addAnnoucementsFailure: (error) {
            context.pop();
            showToast(toastMsg: error.error, state: ToastStates.error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
