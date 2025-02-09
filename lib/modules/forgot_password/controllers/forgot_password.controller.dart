import 'package:get/get.dart';

enum ForgotPasswordViewStateEnum { sendEmailForm, otpForm, newPasswordForm }

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to =>
      Get.find<ForgotPasswordController>();
  Rx<ForgotPasswordViewStateEnum> viewState =
      ForgotPasswordViewStateEnum.sendEmailForm.obs;
}
