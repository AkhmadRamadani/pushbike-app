import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/countdown_text_timer_widget.dart';
import 'package:pushbike_app/modules/forgot_password/controllers/input_otp_form.controller.dart';

class InputOtpForm extends StatelessWidget {
  const InputOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InpuOtpFormController>(
      init: InpuOtpFormController(),
      builder: (state) {
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              Text(
                'Masukkan Kode OTP',
                style: AppTextStyles.title16Bold.copyWith(
                  fontSize: 24.sp,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Kode OTP telah dikirim ke alamat email\n',
                    style: AppTextStyles.body14Regular.copyWith(
                      fontSize: 12.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'akhmdramadni18@gmail.com',
                        style: AppTextStyles.body14Regular.copyWith(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: const TextStyle(
                    color: ColorConst.blue100,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12.r),
                    fieldWidth: 50,
                    fieldHeight: 50,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.transparent,
                    selectedColor: ColorConst.blue50,
                    inactiveColor: ColorConst.textColour30,
                    activeColor: ColorConst.textColour30,
                    inactiveFillColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.transparent,
                  cursorColor: ColorConst.blue100,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: state.errorController,
                  controller: state.otpController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.submitOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: ColorConst.blue100,
                  disabledBackgroundColor: ColorConst.textColour40,
                ),
                child: Text(
                  'Verifikasi',
                  style: AppTextStyles.h418Semibold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kirim Ulang Kode OTP dalam',
                    style: AppTextStyles.body14Regular.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  const SizedBox(width: 4),
                  CountdownTextTimerWidget(
                    initialSeconds: 130,
                    textStyle: AppTextStyles.body14Regular.copyWith(
                      fontSize: 12.sp,
                      color: ColorConst.blue100,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
