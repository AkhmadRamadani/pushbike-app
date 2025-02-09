import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordFormController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with login or other actions.
      if (kDebugMode) {
        print("Form submitted successfully!");
      }
    }
  }
}
