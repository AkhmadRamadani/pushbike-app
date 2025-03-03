import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class CustomReusableDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onClose;

  const CustomReusableDialogWidget({
    super.key,
    required this.title,
    required this.content,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title Section
          Container(
            decoration: BoxDecoration(
              color: ColorConst.blue100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Placeholder for alignment
                SizedBox(width: 24.w, height: 24.w),
                Text(
                  title,
                  style: AppTextStyles.title16Semibold.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: onClose ?? () => Get.back(),
                ),
              ],
            ),
          ),
          // Content Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            child: SingleChildScrollView(child: content),
          ),
        ],
      ),
    );
  }
}
