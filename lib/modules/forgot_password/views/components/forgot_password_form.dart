import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/form_validation_helper.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/forgot_password_form.controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordFormController>(
      init: ForgotPasswordFormController(),
      builder: (state) {
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              Text(
                'Lupa Password',
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
                  'Masukkan Email Anda untuk proses verifikasi akun. Kami akan mengirimkan 4 digit code ke Email Anda',
                  style: AppTextStyles.body14Regular.copyWith(
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              CustomInputTextWidget(
                label: 'Email',
                hintText: 'Masukkan email',
                validators: [
                  (value) => FormValidationHelper.validateEmail(value)
                ],
              ),
              const SizedBox(height: 40),
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
                  'Kirim',
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
