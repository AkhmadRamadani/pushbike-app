import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password.controller.dart';

class InpuOtpFormController extends GetxController {
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  void submitOtp() {
    if (formKey.currentState!.validate()) {
      ForgotPasswordController.to.viewState.value =
          ForgotPasswordViewStateEnum.newPasswordForm;
    }
  }

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void onClose() {
    errorController!.close();

    super.onClose();
  }
}
