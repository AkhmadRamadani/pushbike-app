import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/pembayaran/controllers/riwayat_pembayaran.controller.dart';
import 'package:pushbike_app/modules/pembayaran/models/payment_data_model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/payment_card.dart';

class RiwayatPembayaranView extends StatelessWidget {
  const RiwayatPembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RiwayatPembayaranController());
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Riwayat Pembayaran',
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getPaymentHistory(
            isRefresh: true,
            pageKey: 0,
          );
        },
        color: ColorConst.blue100,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () =>
                controller.paymentHistoryState.value.whenOrNull(
                  success: (data) {
                    return PagedListView<int, PaymentHistoryDatum>(
                      pagingController: controller.pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<PaymentHistoryDatum>(
                        itemBuilder: (context, item, index) {
                          // final item = item;
                          final payment =
                              PaymentDataModel.fromPaymetHistoryDatum(
                            item,
                          );
                          return PaymentCard(
                            month: payment.month,
                            amount: payment.amount,
                            lateText: payment.lateText,
                            dateTime: payment.dateTime,
                          );
                        },
                      ),
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
        ),
      ),
    );
  }
}
