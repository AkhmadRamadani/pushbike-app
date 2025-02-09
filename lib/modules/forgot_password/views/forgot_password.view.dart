import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/widget/auth/auth_background_stack_widget.dart';
import 'package:pushbike_app/core/widget/auth/auth_content_widget.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password.controller.dart';
import 'package:pushbike_app/modules/forgot_password/views/components/forgot_password_form.dart';
import 'package:pushbike_app/modules/forgot_password/views/components/input_otp_form.dart';
import 'package:pushbike_app/modules/forgot_password/views/components/reset_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgotPasswordController());
    return Scaffold(
      body: Stack(
        children: [
          AuthBackgroundStackWidget(
            top: 40.h,
          ),
          AuthContentWidget(
            child: Obx(
              () => ConditionalSwitch.single(
                context: context,
                valueBuilder: (context) => controller.viewState.value,
                caseBuilders: {
                  ForgotPasswordViewStateEnum.sendEmailForm:
                      (BuildContext context) => const ForgotPasswordForm(),
                  ForgotPasswordViewStateEnum.otpForm: (BuildContext context) =>
                      const InputOtpForm(),
                  ForgotPasswordViewStateEnum.newPasswordForm:
                      (BuildContext context) => const ResetPasswordForm(),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
