import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:pushbike_app/modules/modul/controllers/modul.controller.dart';
import 'package:pushbike_app/modules/modul/models/responses/get_list_modul_video.response.model.dart';

class ModulView extends StatelessWidget {
  const ModulView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ModulController>();
    return Scaffold(
      appBar: GeneralAppBarWidget(
        title: 'Modul Latihan',
        actions: [
          // IconButton(
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {

          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24.w),
            //   child: Column(
            //     children: [
            //       SizedBox(height: 16.h),
            //       _buildPointsReminder(
            //         PointModel(
            //           poin: 10,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 36.h,
              child: Obx(
                () =>
                    controller.kategoriModulState.value.whenOrNull(
                      success: (data) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller
                                    .setSelectedKategoriModul(data[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                margin: index == 0
                                    ? const EdgeInsets.only(left: 24)
                                    : index == data.length - 1
                                        ? const EdgeInsets.only(right: 24)
                                        : null,
                                decoration: BoxDecoration(
                                  color: controller
                                              .selectedKategoriModul.value.id ==
                                          data[index].id
                                      ? ColorConst.blue100
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: controller
                                              .selectedKategoriModul.value.id ==
                                          data[index].id
                                      ? null
                                      : Border.all(
                                          color: ColorConst.textColour50,
                                        ),
                                ),
                                child: Center(
                                  child: Text(
                                    data[index].nama ?? "",
                                    style: AppTextStyles.body14Regular.copyWith(
                                      fontWeight: controller
                                                  .selectedKategoriModul
                                                  .value
                                                  .id ==
                                              data[index].id
                                          ? FontWeight.w600
                                          : null,
                                      color: controller.selectedKategoriModul
                                                  .value.id ==
                                              data[index].id
                                          ? Colors.white
                                          : ColorConst.textColour50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: data.length,
                      ),
                      loading: () => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: index == 0
                                ? const EdgeInsets.only(left: 24)
                                : index == 9
                                    ? const EdgeInsets.only(right: 24)
                                    : null,
                            child: CustomShimmerWidget.buildShimmerWidget(
                              width: 100.w,
                              height: 36.h,
                              radius: 16.r,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: 10,
                      ),
                    ) ??
                    const SizedBox(),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Obx(
                () =>
                    controller.listModulVideoState.value.whenOrNull(
                      success: (data) =>
                          PagedListView<int, ListModulVideoDatum>(
                        pagingController: controller.pagingController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        builderDelegate:
                            PagedChildBuilderDelegate<ListModulVideoDatum>(
                          itemBuilder: (context, item, index) {
                            return Container(
                              width: double.infinity,
                              height: 200.h,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: ColorConst.textColour10,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.network(
                                      item.thumbnail ?? "",
                                      width: double.infinity,
                                      height: 200.h,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(
                                          Icons.broken_image,
                                          size: 50.sp,
                                        );
                                      },
                                    ),
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.navigateToYoutube(
                                            item.linkYoutube ?? "");
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                        ),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: ColorConst.blue100,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16.h,
                                    right: 16.w,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withAlpha(80),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Text(
                                        item.formatDuration(item.durasi ?? 0),
                                        style: AppTextStyles.caption12Regular
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ) ??
                    const SizedBox(),
              ),
              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {

              //   },
              //   separatorBuilder: (context, index) =>
              //       const SizedBox(height: 16),
              //   itemCount: 5,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsReminder(PointModel point) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: ColorConst.textColour10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info,
                color: ColorConst.dangerMain,
                size: 14.sp,
              ),
              const SizedBox(width: 4),
              Text(
                "Perhatian",
                style: AppTextStyles.caption12Semibold,
              ),
            ],
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Dapatkan ",
                    style: AppTextStyles.captionLimited10Regular,
                  ),
                  TextSpan(
                    text: "+${point.poin ?? 0} Poin ",
                    style: AppTextStyles.captionLimited10Semibold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorConst.blueText,
                    ),
                  ),
                  TextSpan(
                    text: "jika menonton video min 80% dari total durasi!",
                    style: AppTextStyles.captionLimited10Regular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
