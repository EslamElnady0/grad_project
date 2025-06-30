import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/data/models/sub_to_push_notifications_model.dart';
import 'package:grad_project/core/data/repos/sub_to_notification_repo.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/services/firebase_messaging_service.dart';
import 'package:grad_project/features/auth/logic/cubit/login_state.dart';

import '../../../../core/helpers/shared_pref_helper.dart' show SharedPrefHelper;
import '../../../../core/networking/dio_factory.dart' show DioFactory;
import '../../data/models/login_request_model.dart';
import '../../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final SubToNotificationRepo _subToNotificationRepo;

  LoginCubit(this._loginRepo, this._subToNotificationRepo)
      : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();

  void emitLoginStates({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestModel(
        email: email,
        password: password,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.data?[0].accessToken ?? '',
          loginResponse.data?[0].user?.id.toString() ?? '');
      await _subToNotificationRepo.saveToken(
        SubToPushNotificationsModel(
            userId: loginResponse.data?[0].user?.id.toString() ?? '',
            deviceToken: FirebaseMessagingService().fcmToken ?? ''),
      );
      emit(LoginState.success(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.error(apiErrorModel));
    });
  }

  Future<void> saveUserToken(String token, String userId) async {
    await SharedPrefHelper.setSecuredString(Constants.token, token);
    await SharedPrefHelper.setData(Constants.userId, userId);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
