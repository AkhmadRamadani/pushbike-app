
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class RaceRecapCard extends StatelessWidget {
  final String points;
  final String raceName;
  final String subtitle;
  final String date;
  final String status;

  const RaceRecapCard({
    super.key,
    required this.points,
    required this.raceName,
    required this.subtitle,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(1.sp),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: ColorConst.successBorder,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        points,
                        style: AppTextStyles.h418Semibold
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        'Poin',
                        style: AppTextStyles.captionLimited10Regular
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      raceName,
                      style: AppTextStyles.title16Semibold,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.body14Regular
                          .copyWith(color: ColorConst.textColour40),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: ColorConst.blue30,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Iconify(
                        MaterialSymbols.calendar_month,
                        color: ColorConst.blue100,
                        size: 16,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        date,
                        style: AppTextStyles.caption12Regular.copyWith(
                          color: ColorConst.blue100,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.w,
                  height: 24.h,
                  color: ColorConst.blue100,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Iconify(
                        Bi.people,
                        color: ColorConst.blue100,
                        size: 16,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        status,
                        style: AppTextStyles.caption12Regular.copyWith(
                          color: ColorConst.blue100,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
