import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/form_validation_helper.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/pengaturan/views/subfeatures/change_password/controllers/change_password.controller.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) {
        return Scaffold(
          appBar: const GeneralAppBarWidget(title: 'Ubah Password'),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              height: 1.sh,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomInputTextWidget(
                      label: 'Password Lama',
                      hintText: 'Masukkan password',
                      controller: controller.oldPasswordController,
                      validators: [
                        (value) => FormValidationHelper.validatePassword(value,
                            minLength: 8)
                      ],
                      isPasswordField: true,
                    ),
                    SizedBox(height: 12.h),
                    CustomInputTextWidget(
                      label: 'Password Baru',
                      hintText: 'Masukkan password',
                      controller: controller.passwordController,
                      validators: [
                        (value) => FormValidationHelper.validatePassword(value,
                            minLength: 8)
                      ],
                      isPasswordField: true,
                    ),
                    SizedBox(height: 12.h),
                    CustomInputTextWidget(
                      label: 'Ulangi Password',
                      hintText: 'Masukkan password',
                      controller: controller.passwordConfirmationController,
                      validators: [
                        (value) => FormValidationHelper.validatePassword(value,
                            minLength: 8),
                        (value) => FormValidationHelper.validateMatch(
                            value, controller.passwordController.text,
                            fieldName: 'Password Confirmation'),
                      ],
                      isPasswordField: true,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.submitForm,
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
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
