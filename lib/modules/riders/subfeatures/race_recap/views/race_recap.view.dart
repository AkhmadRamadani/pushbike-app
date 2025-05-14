import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/widget/custom_reusable_dialog_widget.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/controllers/race_recap.controller.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/index_hasil_race.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/views/components/race_recap_card.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/views/components/tambah_hasil_race_dialog.dart';

class RaceRecapView extends StatelessWidget {
  const RaceRecapView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RaceRecapController());
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Race History',
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.dialog(
            const CustomReusableDialogWidget(
              title: 'Tambah Data Race',
              content: TambahHasilRaceDialog(),
            ),
          );
        },
        backgroundColor: ColorConst.blue100,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 32.h),
              _buildRaceSummary(controller),
              SizedBox(height: 24.h),
              _buildRaceHistoryList(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRaceSummary(RaceRecapController controller) {
    Widget buildSummaryColumn(String value, String label) {
      return Column(
        children: [
          Text(
            value,
            style: AppTextStyles.h418Semibold.copyWith(color: Colors.white),
          ),
          Text(
            label,
            style: AppTextStyles.captionLimited10Regular
                .copyWith(color: Colors.white),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: ColorConst.gradientGreen,
        ),
        child: Column(
          children: [
            Obx(
              () =>
                  controller.dataRaceRecapRider.value.whenOrNull(
                    success: (data) => buildSummaryColumn(
                        '${data.totalPoints}', 'Total Poin Race'),
                    loading: () => CustomShimmerWidget.buildShimmerWidget(
                      width: 80.w,
                      height: 48.h,
                    ),
                    error: (message) => Text(message),
                    empty: (message) => Text(message),
                  ) ??
                  const SizedBox.shrink(),
            ),
            Separator(
              thickness: 1.h,
              color: Colors.white,
              height: 12.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () =>
                        controller.dataRaceRecapRider.value.whenOrNull(
                          success: (data) => buildSummaryColumn(
                              '${data.totalRaceThisMonth}',
                              'Total Join Race Bulan ini'),
                          loading: () => CustomShimmerWidget.buildShimmerWidget(
                            width: 80.w,
                            height: 48.h,
                          ),
                          error: (message) => Text(message),
                          empty: (message) => Text(message),
                        ) ??
                        const SizedBox.shrink(),
                  ),
                ),
                Container(
                  width: 1.w,
                  height: 48.h,
                  color: Colors.white,
                ),
                Expanded(
                  child: Obx(
                    () =>
                        controller.dataRaceRecapRider.value.whenOrNull(
                          success: (data) => buildSummaryColumn(
                              '${data.totalRace}', 'Total Join Race'),
                          loading: () => CustomShimmerWidget.buildShimmerWidget(
                            width: 80.w,
                            height: 48.h,
                          ),
                          error: (message) => Text(message),
                          empty: (message) => Text(message),
                        ) ??
                        const SizedBox.shrink(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRaceHistoryList(RaceRecapController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Obx(
            () =>
                controller.listHasilEvent.value.whenOrNull(
                  success: (data) {
                    return PagedListView<int, DatumHasilEvent>.separated(
                      pagingController: controller.pagingController,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builderDelegate:
                          PagedChildBuilderDelegate<DatumHasilEvent>(
                        itemBuilder: (context, item, index) {
                          return RaceRecapCard(
                            points: "${item.event?.poin ?? 0}",
                            raceName: item.event?.judul ?? "",
                            subtitle:
                                "Podium ${item.podium ?? ""} ${item.kategori ?? ""}",
                            date: item.event?.tanggalRace
                                    ?.toDayMonthYearString() ??
                                "",
                            status: "Approved",
                          );
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
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
                          controller.getIndexHasilEvent();
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
        ],
      ),
    );
  }
}
