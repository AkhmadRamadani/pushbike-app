import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/core/widget/informasi_card_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/information/controllers/information.controller.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<InformationController>(InformationController());

    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Informasi',
      ),
      body: Obx(
        () =>
            controller.pengumumanData.value.whenOrNull(
              success: (data) => RefreshIndicator(
                onRefresh: controller.getPengumumanData,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final datum = data[index];
                    return InformasiCardWidget(
                      type: datum.pinPengumuman == 1
                          ? MemoCardType.pinned
                          : MemoCardType.normal,
                      read: (datum.isRead ?? false)
                          ? MemoStatusRead.read
                          : MemoStatusRead.unread,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.informationDetail,
                          arguments: datum,
                        );
                      },
                      changeBackground: true,
                      data: datum,
                    );
                  },
                  separatorBuilder: (context, index) => const Separator.i20(),
                  itemCount: data.length,
                ),
              ),
              loading: () => ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  child: CustomShimmerWidget.buildShimmerWidget(
                    width: double.infinity,
                    height: 50.h,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox.shrink(),
                itemCount: 5,
              ),
              empty: (message) => SizedBox(
                child: GeneralEmptyErrorWidget(
                  descText: message,
                  additionalWidgetBellowTextDesc: InkWell(
                      onTap: () {
                        controller.getPengumumanData();
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
              ),
              error: (message) => SizedBox(
                child: GeneralEmptyErrorWidget(
                  descText: message,
                  additionalWidgetBellowTextDesc: InkWell(
                    onTap: () {
                      controller.getPengumumanData();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Refresh",
                        style: AppTextStyles.body14Semibold.copyWith(
                          color: ColorConst.blue100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ) ??
            const SizedBox.shrink(),
      ),
    );
  }
}
