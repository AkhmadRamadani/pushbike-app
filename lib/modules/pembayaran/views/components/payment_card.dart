import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class PaymentCard extends StatelessWidget {
  final String month;
  final String amount;
  final String? lateText; // Optional for current or late payment
  final String? dateTime; // Optional for payment history

  const PaymentCard({
    super.key,
    required this.month,
    required this.amount,
    this.lateText,
    this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              AssetConst.icCheckPembayaran,
              width: 32.w,
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: AppTextStyles.caption12Semibold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorConst.blueText,
                  ),
                ),
                Text(
                  amount,
                  style: AppTextStyles.h418Semibold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorConst.textColour90,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (lateText != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ColorConst.dangerSurface,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    lateText!,
                    style: AppTextStyles.captionLimited10Regular,
                  ),
                ),
              ),
            if (dateTime != null)
              Text(
                dateTime!,
                style: AppTextStyles.caption12Regular,
              ),
          ],
        ),
      ),
    );
  }
}
