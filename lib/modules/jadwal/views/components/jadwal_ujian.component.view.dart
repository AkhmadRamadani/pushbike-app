import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/jadwal/controllers/jadwal.controller.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';

class JadwalUjianView extends StatelessWidget {
  final JadwalController controller;

  const JadwalUjianView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.getUjian,
      child: Obx(
        () =>
            controller.ujianData.value.whenOrNull(
              success: (data) => _buildUjianList(data),
              loading: () => _buildLoadingList(),
              empty: (message) => GeneralEmptyErrorWidget(
                descText: message,
                onRefresh: controller.getUjian,
              ),
              error: (message) => GeneralEmptyErrorWidget(
                descText: message,
                onRefresh: controller.getUjian,
              ),
            ) ??
            const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildUjianList(List<DatumEventCalendar> data) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final ujian = data[index];
        return Card(
          color: Colors.white,
          margin: EdgeInsets.only(
            right: 16,
            left: 16,
            top: index == 0 ? 16 : 0,
            bottom: 0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildUjianIcon(),
                const SizedBox(width: 18),
                Expanded(
                  child: _buildUjianDetails(ujian),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: data.length,
    );
  }

  Widget _buildUjianIcon() {
    return Container(
      width: 85.w,
      height: 85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorConst.blue40,
      ),
      child: Center(
        child: Image.asset(
          AssetConst.icUjian,
          width: 48.w,
        ),
      ),
    );
  }

  Widget _buildUjianDetails(DatumEventCalendar ujian) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ujian.materi ?? "",
          style: AppTextStyles.body14Bold,
        ),
        SizedBox(height: 4.h),
        Text(
          "${ujian.tanggal?.toHumanReadableDateString()}, ${ujian.waktu}",
          style: AppTextStyles.caption12Regular,
        ),
        Text(
          ujian.lokasi ?? '-',
          style: AppTextStyles.caption12Regular,
        ),
      ],
    );
  }

  Widget _buildLoadingList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(16),
        child: CustomShimmerWidget.buildShimmerWidget(
          width: double.infinity,
          height: 100.h,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox.shrink(),
    );
  }
}
