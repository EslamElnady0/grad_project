import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/show_toast.dart';
import 'package:grad_project/core/widgets/custom_modal_progress.dart';
import 'package:grad_project/core/widgets/show_error_dialog.dart';
import 'package:grad_project/features/assignments/data/models/create_assignment_response_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/create_assignment_cubit/create_assignment_state.dart';

class CreateAssignmentBlocConsumer extends StatelessWidget {
  final Widget child;
  const CreateAssignmentBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAssignmentCubit, CreateAssignmentState>(
      listenWhen: (previous, current) {
        return current is CreateAssignmentLoading ||
            current is CreateAssignmentSuccess ||
            current is CreateAssignmentFailure;
      },
      buildWhen: (previous, current) {
        return current is CreateAssignmentLoading ||
            current is CreateAssignmentSuccess ||
            current is CreateAssignmentFailure;
      },
      listener: (context, state) {
        state.mapOrNull(
          createAssignmentSuccess: (data) async {
            CreateAssignmentResponseModel responseData =
                data.data as CreateAssignmentResponseModel;
            showToast(
                toastMsg: responseData.message, state: ToastStates.success);
            context.pop();
          },
          createAssignmentFailure: (error) {
            showErrorDialog(context, error.error);
          },
        );
      },
      builder: (context, state) {
        return CustomModalProgress(
            isLoading: state is CreateAssignmentLoading ? true : false,
            child: child);
      },
    );
  }
}
