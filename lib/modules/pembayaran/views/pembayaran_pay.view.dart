import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/general_helper.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';

class PembayaranPayView extends StatelessWidget {
  const PembayaranPayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Pembayaran',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 24.h),
          Center(
            child: Text(
              "Scan QR",
              style: AppTextStyles.h124Semibold,
            ),
          ),
          SizedBox(height: 12.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bank BCA",
                style: AppTextStyles.title16Regular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nomor Rekening: 123456789",
                    style: AppTextStyles.title16Regular.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      GeneralHelper.copyToClipboard("123456789");
                    },
                    child: Iconify(
                      MaterialSymbols.copy_all_rounded,
                      size: 16.sp,
                      color: ColorConst.blue100,
                    ),
                  ),
                ],
              ),
              Text(
                "Atas Nama: Ammar",
                style: AppTextStyles.title16Regular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              "Scan QRIS untuk melakukan pembayaran",
              style: AppTextStyles.body14Semibold,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 312.w,
            width: 312.w,
            decoration: BoxDecoration(
              color: ColorConst.blue50,
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Iconify(
                  MaterialSymbols.qr_code,
                  size: 240.sp,
                  color: ColorConst.textColour90,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          _buildAdditionalInfo(),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: ColorConst.blue100,
              disabledBackgroundColor: ColorConst.textColour40,
            ),
            child: Text(
              'Kirim Bukti Bayar',
              style: AppTextStyles.h418Semibold.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ColorConst.textColour10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Iconify(
                MaterialSymbols.warning_rounded,
                color: ColorConst.dangerMain,
                size: 18.sp,
              ),
              const SizedBox(width: 4),
              Text(
                "Mohon Diperhatikan",
                style: AppTextStyles.caption12Semibold,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Setelah melakukan transfer dimohon Wali Riders untuk mengirimkan bukti pembayaran. Klik tombol dibawah ini.",
            style: AppTextStyles.caption12Regular,
          ),
        ],
      ),
    );
  }
}
