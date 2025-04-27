import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/modules/authentication/repositories/auth.repository.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get to => Get.find();

  AuthRepository authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      changePassword();
    }
  }

  Future<void> changePassword() async {
    DialogService.showLoading();

    final response = await authRepository.changePassword(
      password: passwordController.text,
      oldPassword: oldPasswordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    DialogService.closeLoading();

    if (response.statusCode == 200) {
      await DialogService.showDialogSuccess(
        title: 'Berhasil',
        description: 'Password berhasil diubah',
      );
      Get.back();
    } else {
      DialogService.showDialogProblem(
        title: 'Gagal',
        description: response.message ?? 'Unknown error occurred.',
      );
    }
  }
}
