import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class OtherEventCardComponent extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String location;
  final String date;
  final String price;
  final String label;
  final Color statusColor;
  final Color labelBackgroundColor;

  const OtherEventCardComponent({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.location,
    required this.date,
    required this.price,
    required this.label,
    this.statusColor = ColorConst.successMain,
    this.labelBackgroundColor = ColorConst.dangerSurface,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 12.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConst.textColour10,
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
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      children: [
                        Iconify(
                          Majesticons.check_circle,
                          color: statusColor,
                          size: 10.sp,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: AppTextStyles.captionLimited10Semibold
                              .copyWith(fontSize: 8.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 90.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body14Semibold.copyWith(
                        color: ColorConst.textColour90,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: [
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
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
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
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
                                color: ColorConst.textColour50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            price,
                            style: AppTextStyles.title16Semibold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: labelBackgroundColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
