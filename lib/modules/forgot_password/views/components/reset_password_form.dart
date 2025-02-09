import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/form_validation_helper.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/reset_password_form.controller.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordFormController>(
      init: ResetPasswordFormController(),
      builder: (state) {
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: AppTextStyles.title16Bold.copyWith(
                  fontSize: 24.sp,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Text(
                  'Silakan masukkan password baru yang akan digunakan untuk Login ke Aplikasi SCR',
                  style: AppTextStyles.body14Regular.copyWith(
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              CustomInputTextWidget(
                label: 'Password Baru',
                hintText: 'Masukkan password',
                controller: state.passwordController,
                validators: [
                  (value) =>
                      FormValidationHelper.validatePassword(value, minLength: 8)
                ],
                isPasswordField: true,
              ),
              const SizedBox(height: 20),
              CustomInputTextWidget(
                label: 'Konfirmasi Password',
                hintText: 'Masukkan password',
                controller: state.confirmPasswordController,
                validators: [
                  (value) => FormValidationHelper.validatePassword(value,
                      minLength: 8),
                  (value) => FormValidationHelper.validateMatch(
                      value, state.passwordController.text,
                      fieldName: 'Password'),
                ],
                isPasswordField: true,
              ),
              const SizedBox(height: 32),
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
                  'Simpan',
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
