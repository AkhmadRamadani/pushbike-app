import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/form_validation_helper.dart';
import 'package:pushbike_app/core/widget/auth/auth_background_stack_widget.dart';
import 'package:pushbike_app/core/widget/auth/auth_content_widget.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/modules/authentication/features/login/controllers/login.controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthBackgroundStackWidget(
            top: 40.h,
          ),
          const AuthContentWidget(
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (state) {
        return Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Riders!',
                style: AppTextStyles.title16Bold.copyWith(
                  fontSize: 26.sp,
                ),
              ),
              Text(
                'Silakan Login ke Akun Anda',
                style: AppTextStyles.body14Regular.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(height: 20),
              CustomInputTextWidget(
                  label: 'Email',
                  hintText: 'Masukkan email',
                  validators: [
                    (value) => FormValidationHelper.validateEmail(value),
                  ],
                  controller: state.emailController,
                  textInputType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  }),
              const SizedBox(height: 20),
              CustomInputTextWidget(
                label: 'Password',
                hintText: 'Masukkan password',
                isPasswordField: true,
                controller: state.passwordController,
                validators: [
                  (value) =>
                      FormValidationHelper.validatePassword(value, minLength: 8)
                ],
                onFieldSubmitted: (p0) {
                  state.submitForm();
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         Get.toNamed(
              //           AppRoutes.forgotPassword,
              //         );
              //       },
              //       child: Text(
              //         'Lupa Password?',
              //         style: TextStyle(
              //           color: ColorConst.blue100,
              //           fontSize: 12.sp,
              //           fontStyle: FontStyle.italic,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: ColorConst.blue100,
                  disabledBackgroundColor: ColorConst.textColour40,
                ),
                child: Text(
                  'Sign In',
                  style: AppTextStyles.h418Semibold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
