import 'package:grad_project/features/weekly_schedule/data/models/update_session_response_model.dart';

abstract class UpdateSessionState {
  const UpdateSessionState();
}

class UpdateSessionInitial extends UpdateSessionState {
  const UpdateSessionInitial();
}

class UpdateSessionLoading extends UpdateSessionState {
  const UpdateSessionLoading();
}

class UpdateSessionSuccess extends UpdateSessionState {
  final UpdateSessionResponseModel response;
  const UpdateSessionSuccess(this.response);
}

class UpdateSessionError extends UpdateSessionState {
  final String error;
  const UpdateSessionError(this.error);
}
