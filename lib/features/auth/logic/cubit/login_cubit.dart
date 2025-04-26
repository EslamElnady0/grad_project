import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/features/auth/logic/cubit/login_state.dart';

import '../../../../core/helpers/shared_pref_helper.dart' show SharedPrefHelper;
import '../../../../core/networking/dio_factory.dart' show DioFactory;
import '../../data/models/login_request_model.dart';
import '../../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.error(apiErrorModel));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(Constants.token, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
