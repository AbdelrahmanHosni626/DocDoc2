

import 'package:docdoc2/features/register/data/models/register_request_body.dart';
import 'package:docdoc2/features/register/data/repos/register_repo.dart';
import 'package:docdoc2/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  
  void emitRegisterStates(RegisterRequestBody registerRequestBody) async {
    emit(const RegisterState.loading());
    final result = await _registerRepo.register(registerRequestBody: registerRequestBody);
    result.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (failure) {
        emit(RegisterState.failure(
            errMessage: failure.apiErrorModel.message ?? ''));
      },
    );
  }
}
