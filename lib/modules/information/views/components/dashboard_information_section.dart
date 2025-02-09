import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/core/widget/informasi_card_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/information/controllers/dashboard_information_section.controller.dart';

class DashboardInformationSection extends StatelessWidget {
  const DashboardInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardInformationSectionController>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            children: [
              Row(
                children: [
                  Iconify(Zondicons.announcement, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    "Informasi",
                    style: AppTextStyles.title16Regular,
                  ),
                  SizedBox(width: 8.w),
                  // Badge(
                  //   backgroundColor: ColorConst.dangerMain,
                  //   label: Text(
                  //     "2",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 10.sp,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.information);
                },
                child: Text(
                  "Lihat Semua",
                  style: AppTextStyles.body14Semibold.copyWith(
                    color: ColorConst.blue100,
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () =>
              controller.pengumumanData.value.whenOrNull(
                success: (data) => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                      data: datum,
                    );
                  },
                  separatorBuilder: (context, index) => const Separator.i20(),
                  itemCount: data.length,
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
      ],
    );
  }
}
