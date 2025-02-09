import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/pembayaran/models/payment_data_model.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/payment_card.dart';

class DetailPembayaranView extends StatelessWidget {
  const DetailPembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentDataModel> paymentDataList = [
      PaymentDataModel(
        month: "Bulan November",
        amount: "Rp. 500.000",
        lateText: "Telat 10 Hari",
      ),
      PaymentDataModel(
        month: "Bulan September",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
      PaymentDataModel(
        month: "Bulan Oktober",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
      PaymentDataModel(
        month: "Bulan November",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
    ];

    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Detail Pembayaran',
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                _buildHeader(),
                SizedBox(height: 16.h),
                _buildMembershipDescription(),
                SizedBox(height: 16.h),
                Text(
                  "Pembayaran Bulanan",
                  style: AppTextStyles.title16Semibold,
                ),
                SizedBox(height: 16.h),
                const PaymentCard(
                  month: "Bulan November",
                  amount: "Rp. 500.000",
                  lateText: "Telat 10 Hari",
                ),
                SizedBox(height: 16.h),
                _buildPointsReminder(),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Separator(thickness: 8.h, color: ColorConst.textColour10),
          SizedBox(height: 4.h),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Riwayat Pembayaran",
                      style: AppTextStyles.title16Semibold,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.pembayaranRiwayat);
                      },
                      child: Text(
                        "Lihat Semua",
                        style: AppTextStyles.body14Semibold.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConst.blueText,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ListView.builder(
                  shrinkWrap: true, // Ensures it takes only the necessary space
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: paymentDataList.length,
                  itemBuilder: (context, index) {
                    final payment = paymentDataList[index];
                    return PaymentCard(
                      month: payment.month,
                      amount: payment.amount,
                      lateText: payment.lateText,
                      dateTime: payment.dateTime,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                _buildButtonPerpanjang(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonPerpanjang() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.pembayaranPay);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorConst.blue100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            "Perpanjang Member",
            style: AppTextStyles.h418Bold.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, Ammar!",
          style: AppTextStyles.h320Semibold,
        ),
        const Spacer(),
        Text(
          'Boys, 2020',
          style: AppTextStyles.title16Regular,
        ),
      ],
    );
  }

  Widget _buildMembershipDescription() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Saat ini Kamu terdaftar sebagai ",
            style: AppTextStyles.body14Regular,
          ),
          TextSpan(
            text: "Reguler Membership ",
            style: AppTextStyles.body14Semibold.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorConst.blueText,
            ),
          ),
          TextSpan(
            text: "di SCR Kids Community.",
            style: AppTextStyles.body14Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildPointsReminder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorConst.textColour10,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Dapatkan ",
                style: AppTextStyles.caption12Regular,
              ),
              TextSpan(
                text: "+10 Poin ",
                style: AppTextStyles.caption12Semibold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConst.blueText,
                ),
              ),
              TextSpan(
                text: "apabila membayar tepat waktu!",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
