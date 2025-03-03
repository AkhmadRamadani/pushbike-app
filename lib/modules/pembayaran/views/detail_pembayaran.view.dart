import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/pembayaran/controllers/detail_pembayaran.controller.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/payment_card.dart';

class DetailPembayaranView extends StatelessWidget {
  const DetailPembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailPembayaranController>();

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
                _buildHeader(controller),
                SizedBox(height: 16.h),
                _buildMembershipDescription(controller),
                SizedBox(height: 16.h),
                Text(
                  "Pembayaran Bulanan",
                  style: AppTextStyles.title16Semibold,
                ),
                SizedBox(height: 16.h),
                Obx(
                  () =>
                      controller.latestBillState.value.whenOrNull(
                        success: (data) {
                          String? lateText = controller.setIsThisMonthLate(
                            pembayaran: data.pembayaran,
                            membership: data.membership,
                          );
                          return Visibility(
                            visible: data.pembayaran != null,
                            replacement: PaymentCard(
                              month:
                                  "Bulan ${controller.selectedDate.toReadableMonth()}",
                              amount: data.membership?.hargaNum.toRupiah() ??
                                  "Rp. 0",
                              lateText: lateText,
                            ),
                            child: PaymentCard(
                              month:
                                  "Bulan ${controller.selectedDate.toReadableMonth()}",
                              amount:
                                  "${data.pembayaran?.nominalNum.toRupiah()}",
                              dateTime: data.pembayaran?.createdAt
                                      ?.toDayMonthYearHourMinuteString() ??
                                  "",
                            ),
                          );
                        },
                        loading: () => CustomShimmerWidget.buildShimmerWidget(
                          width: double.infinity,
                          height: 75.h,
                          radius: 16.r,
                        ),
                      ) ??
                      const SizedBox(),
                ),
                SizedBox(height: 16.h),
                Obx(
                  () =>
                      controller.latestBillState.value.whenOrNull(
                        success: (data) {
                          return _buildPointsReminder(data.point?.poin ?? 0);
                        },
                        loading: () => CustomShimmerWidget.buildShimmerWidget(
                          width: double.infinity,
                          height: 30.h,
                          radius: 50.r,
                        ),
                      ) ??
                      const SizedBox(),
                ),
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
                Obx(
                  () =>
                      controller.paymentHistoryState.value.whenOrNull(
                        success: (data) {
                          return ListView.builder(
                            shrinkWrap:
                                true, // Ensures it takes only the necessary space
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final payment = data[index];
                              return PaymentCard(
                                month: payment.month,
                                amount: payment.amount,
                                lateText: payment.lateText,
                                dateTime: payment.dateTime,
                              );
                            },
                          );
                        },
                        loading: () => ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: CustomShimmerWidget.buildShimmerWidget(
                              width: double.infinity,
                              height: 75.h,
                              radius: 16,
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox.shrink(),
                          itemCount: 5,
                        ),
                        error: (message) => GeneralEmptyErrorWidget(
                          descText: message,
                          additionalWidgetBellowTextDesc: InkWell(
                              onTap: () {
                                controller.getPaymentHistory();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "Refresh",
                                  style: AppTextStyles.body14Semibold.copyWith(
                                    color: ColorConst.blue100,
                                  ),
                                ),
                              )),
                        ),
                      ) ??
                      const SizedBox(),
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
        Get.toNamed(
          AppRoutes.pembayaranPay,
          arguments: {
            'tipe': 'Iuran',
          },
        );
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

  Widget _buildHeader(DetailPembayaranController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, ${controller.localUserData?.selectedRider?.panggilan ?? "Rider"}!",
          style: AppTextStyles.h320Semibold,
        ),
        const Spacer(),
        Text(
            '${controller.localUserData?.selectedRider?.gender == 1 ? "Girls" : "Boys"}, ${controller.localUserData?.selectedRider?.tanggalLahir?.year}',
            style: AppTextStyles.title16Regular),
      ],
    );
  }

  Widget _buildMembershipDescription(DetailPembayaranController controller) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Saat ini Kamu terdaftar sebagai ",
            style: AppTextStyles.body14Regular,
          ),
          TextSpan(
            text:
                "${controller.localUserData?.membership?.judulMember ?? "Member"} ",
            style: AppTextStyles.body14Semibold.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorConst.blueText,
            ),
          ),
          TextSpan(
            text:
                "di ${controller.localUserData?.komunitas?.namaKomunitas ?? "Komunitas"}.",
            style: AppTextStyles.body14Regular,
          ),
        ],
      ),
    );
  }

  Widget _buildPointsReminder(int poin) {
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
                text: "+$poin Poin ",
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
