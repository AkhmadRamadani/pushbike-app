import 'package:get/get.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password.controller.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password_form.controller.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/input_otp_form.controller.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/reset_password_form.controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.put(ForgotPasswordFormController());
    Get.put(InpuOtpFormController());
    Get.put(ResetPasswordFormController());
  }
}
