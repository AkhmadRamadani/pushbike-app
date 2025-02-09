import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uiw.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';

class FloatingPaymentComponent extends StatelessWidget {
  const FloatingPaymentComponent({
    super.key,
    this.data,
  });

  final LocalRiderMembership? data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 10.h,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.pembayaran);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [ColorConst.blue90, ColorConst.green100],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              bottomLeft: Radius.circular(50.r),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: ColorConst.dangerMain, width: 1),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Iconify(
                    Uiw.warning_o,
                    color: ColorConst.dangerMain,
                    size: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Pembayaran Iuran",
                    style: AppTextStyles.caption12Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    (data?.hargaNum ?? 0).toRupiah(),
                    style: AppTextStyles.caption12Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
