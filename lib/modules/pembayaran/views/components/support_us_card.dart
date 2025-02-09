import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';

class SupportUsCard extends StatelessWidget {
  const SupportUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetConst.backgroundSupportUsCard),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MARI BERKONTRIBUSI BERSAMA KAMI",
            style: AppTextStyles.captionLimited10Bold.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorConst.blue100,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "SUPPORT US!",
            style: AppTextStyles.h124Bold.copyWith(
              color: ColorConst.textColour90,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "Setiap kontribusi yang Anda\nberikan sangat berharga!",
            style: AppTextStyles.caption12Regular,
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.pembayaranPay);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: ColorConst.blueText,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                "Support Now",
                style: AppTextStyles.caption12Bold.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
