import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/custom_tabbar_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/controllers/riders_checkpoint.controller.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/repositories/riders_checkpoint.repository.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/views/components/checkpoint_card.component.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/views/components/dialog_input_data_checkpoint.dart';

class RidersCheckpointView extends StatelessWidget {
  const RidersCheckpointView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RidersCheckpointController());
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Riders Checkpoint'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            _buildPointsReminder(),
            const SizedBox(height: 16),
            _buildTabBar(controller),
            Expanded(
              child: TabBarView(
                controller: controller.tabController!,
                children: [
                  Obx(
                    () =>
                        controller.listRiderCheckpointBasicState.value
                            .whenOrNull(
                          success: (data) {
                            return _buildAdminDataList(controller);
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
                          error: (message) => Center(
                            child: GeneralEmptyErrorWidget(
                              descText: message,
                              onRefresh: () => controller
                                  .getRiderCheckpointBasic(isRefresh: true),
                            ),
                          ),
                          empty: (message) => Center(
                            child: GeneralEmptyErrorWidget(
                              descText: message,
                              onRefresh: () => controller
                                  .getRiderCheckpointBasic(isRefresh: true),
                            ),
                          ),
                        ) ??
                        const SizedBox(),
                  ),
                  Obx(
                    () =>
                        controller.listRiderCheckpointTestState.value
                            .whenOrNull(
                          success: (data) {
                            return RefreshIndicator(
                              onRefresh: () =>
                                  controller.getRiderCheckpointTest(
                                isRefresh: true,
                              ),
                              child: PagedListView<int, DatumRiderCheckpoint>(
                                pagingController:
                                    controller.pagingControllerTest,
                                padding: EdgeInsets.zero,
                                builderDelegate: PagedChildBuilderDelegate<
                                    DatumRiderCheckpoint>(
                                  itemBuilder: (context, item, index) {
                                    return _buildTestDataCard(index,
                                        data: item);
                                  },
                                ),
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
                          error: (message) => Center(
                            child: GeneralEmptyErrorWidget(
                              descText: message,
                              onRefresh: () => controller
                                  .getRiderCheckpointTest(isRefresh: true),
                            ),
                          ),
                          empty: (message) => Center(
                            child: GeneralEmptyErrorWidget(
                              descText: message,
                              onRefresh: () => controller
                                  .getRiderCheckpointTest(isRefresh: true),
                            ),
                          ),
                        ) ??
                        const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(RidersCheckpointController controller) {
    return CustomTabbarWidget(
      tabController: controller.tabController!,
      padding: EdgeInsets.zero,
      tabs: const [
        Tab(text: 'Data Administrasi'),
        Tab(text: 'Hasil Test'),
      ],
    );
  }

  Widget _buildPointsReminder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: ColorConst.textColour10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.info, color: ColorConst.dangerMain, size: 14.sp),
              const SizedBox(width: 4),
              Text("Perhatian", style: AppTextStyles.caption12Semibold),
            ],
          ),
          Center(
            child: Text(
              "Setiap melampirkan video/foto dimohon ukuran file max 5mb",
              style: AppTextStyles.captionLimited10Regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminDataList(RidersCheckpointController controller) {
    return RefreshIndicator(
      onRefresh: () => controller.getRiderCheckpointBasic(isRefresh: true),
      child: PagedListView<int, DatumRiderCheckpoint>(
        pagingController: controller.pagingControllerBasic,
        padding: EdgeInsets.zero,
        builderDelegate: PagedChildBuilderDelegate<DatumRiderCheckpoint>(
          itemBuilder: (context, item, index) {
            return _buildAdminDataCard(index, data: item);
          },
        ),
      ),
    );
  }

  Widget _buildAdminDataCard(int index, {required DatumRiderCheckpoint data}) {
    return CheckpointCardComponent(
      data: data,
      margin: index == 0
          ? EdgeInsets.only(bottom: 2.h, top: 16.h, left: 2.w, right: 2.w)
          : EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      onTap: () {
        Get.dialog(
          DialogInputDataCheckpoint(
              data: data, kategori: RidersCheckpointKategori.basic),
        );
      },
    );
  }

  Widget _buildTestDataCard(int index, {required DatumRiderCheckpoint data}) {
    return CheckpointCardComponent(
      data: data,
      margin: index == 0
          ? EdgeInsets.only(bottom: 2.h, top: 16.h, left: 2.w, right: 2.w)
          : EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      onTap: () {
        Get.dialog(
          DialogInputDataCheckpoint(
              data: data, kategori: RidersCheckpointKategori.hasilTest),
        );
      },
    );
  }

  Widget _buildTestResults(RidersCheckpointController controller) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // _buildCalendarHeader(),
        Obx(
          () =>
              controller.listRiderCheckpointTestState.value.whenOrNull(
                success: (data) {
                  return PagedListView<int, DatumRiderCheckpoint>(
                    pagingController: controller.pagingControllerTest,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    builderDelegate:
                        PagedChildBuilderDelegate<DatumRiderCheckpoint>(
                      itemBuilder: (context, item, index) {
                        return _buildAdminDataCard(index, data: item);
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
                  separatorBuilder: (context, index) => const SizedBox.shrink(),
                  itemCount: 5,
                ),
                error: (message) => GeneralEmptyErrorWidget(
                  descText: message,
                ),
                empty: (message) => GeneralEmptyErrorWidget(
                  descText: message,
                ),
              ) ??
              const SizedBox(),
        ),
      ],
    );
  }

  // Widget _buildCalendarHeader() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: ColorConst.blue100,
  //       borderRadius: BorderRadius.circular(8.r),
  //     ),
  //     child: GetBuilder<RidersCheckpointController>(
  //       builder: (state) {
  //         return Row(
  //           children: [
  //             InkWell(
  //               onTap: state.previousMonth,
  //               child: Iconify(MaterialSymbols.arrow_back_ios,
  //                   color: Colors.white, size: 18.sp),
  //             ),
  //             const Spacer(),
  //             Text(
  //               state.selectedDate.toMonthYearString(),
  //               style: AppTextStyles.body14Bold.copyWith(color: Colors.white),
  //             ),
  //             const Spacer(),
  //             InkWell(
  //               onTap: state.nextMonth,
  //               child: Iconify(MaterialSymbols.arrow_forward_ios,
  //                   color: Colors.white, size: 18.sp),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }
}
