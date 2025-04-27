import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/helpers/local_db.helper.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/modules/authentication/repositories/auth.repository.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      login();
    }
  }

  Future<void> login() async {
    DialogService.showLoading();

    try {
      final response = await authRepository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      DialogService.closeLoading();

      if (response.statusCode == 200 && response.data?.accessToken != null) {
        await getLoggedInUserData(response.data!.accessToken!);
      } else {
        DialogService.closeLoading();
        DialogService.showDialogProblem(
          title: 'Login Gagal',
          description: response.message ?? 'Unknown error occurred.',
        );
      }
    } catch (e, stackTrace) {
      DialogService.closeLoading();
      DialogService.showDialogProblem(
        title: 'Login Gagal',
        description: e.toString(),
      );
      debugPrint('Error during login: $e\nStackTrace: $stackTrace');
    }
  }

  Future<void> getLoggedInUserData(String token) async {
    try {
      final response = await authRepository.getUserData(token: token);

      if (response.statusCode == 200 && response.data != null) {
        DialogService.closeLoading();

        if (response.data?.wali?.riders == null ||
            response.data?.wali?.riders?.isEmpty == true) {
          DialogService.showDialogProblem(
            title: 'Login Gagal',
            description: 'Anda belum mendaftarkan rider',
          );
          return;
        }
        await LocalDBHelper.setUserLocalData(response, token);
        if (LocalDbService.getUserLocalDataSync()?.komunitas != null) {
          Get.offNamed(AppRoutes.onBoard);
        } else {
          Get.offNamed(AppRoutes.home);
        }
      } else {
        throw Exception(response.message ?? 'Failed to fetch user data.');
      }
    } catch (e, stackTrace) {
      DialogService.showDialogProblem(
        title: 'Login Gagal',
        description: e.toString(),
      );
      await LocalDbService.clearLocalData();
      debugPrint(
          'Error during fetching user data: $e\nStackTrace: $stackTrace');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
