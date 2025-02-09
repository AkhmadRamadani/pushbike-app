import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class ThisMonthEventCardComponent extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String location;
  final String date;
  final String price;
  final String label;

  const ThisMonthEventCardComponent({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.location,
    required this.date,
    required this.price,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        width: 212.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      children: [
                        Iconify(
                          Majesticons.check_circle,
                          color: ColorConst.successMain,
                          size: 12.sp,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: AppTextStyles.captionLimited10Semibold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.body14Semibold.copyWith(
                color: ColorConst.textColour90,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Iconify(
                  Majesticons.location_marker,
                  size: 12.sp,
                  color: ColorConst.textColour50,
                ),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: AppTextStyles.captionLimited10Regular.copyWith(
                    color: ColorConst.textColour50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Iconify(
                  Mdi.calendar_month_outline,
                  size: 12.sp,
                  color: ColorConst.textColour50,
                ),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: AppTextStyles.captionLimited10Regular.copyWith(
                    color: ColorConst.textColour50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    price,
                    style: AppTextStyles.caption12Semibold,
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConst.successBorder,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Text(
                    label,
                    style: AppTextStyles.captionLimited10Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
