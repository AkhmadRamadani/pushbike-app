import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password.controller.dart';

class ForgotPasswordFormController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      ForgotPasswordController.to.viewState.value =
          ForgotPasswordViewStateEnum.otpForm;
    }
  }
}
