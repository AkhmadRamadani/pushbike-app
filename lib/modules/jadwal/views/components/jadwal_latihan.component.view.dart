import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/pepicons.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/jadwal/controllers/jadwal.controller.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:pushbike_app/modules/jadwal/views/components/calendar_builder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JadwalLatihanView extends StatelessWidget {
  final JadwalController controller;

  const JadwalLatihanView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.getEventCalendar,
      child: ListView(
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Obx(
                  () =>
                      controller.pointData.value.whenOrNull(
                        success: (data) => _buildPointsReminder(data),
                        loading: () => CustomShimmerWidget.buildShimmerWidget(
                          width: double.infinity,
                          height: 40.h,
                          radius: 50.r,
                        ),
                      ) ??
                      const SizedBox(),
                ),
                SizedBox(height: 16.h),
                _buildCalendarHeader(),
                SizedBox(height: 16.h),
                Stack(
                  children: [
                    _buildCalendar(),
                    Obx(
                      () => controller.eventCalendar.value.isLoading()
                          ? _buildLoadingOverlay()
                          : const SizedBox(),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildLegend(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          GetBuilder<JadwalController>(
            id: "detailInformation",
            builder: (controller) {
              return Visibility(
                visible: controller.selectedEvent != null,
                child: Column(
                  children: [
                    Separator(thickness: 8.h, color: ColorConst.textColour10),
                    _buildDetailInformation(),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 24.h),
          // Separator(thickness: 8.h, color: ColorConst.textColour10),
          // _buildTrainingHistory(),
        ],
      ),
    );
  }

  Widget _buildPointsReminder(PointModel point) {
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
                text: "+${point.poin ?? 0} Poin ",
                style: AppTextStyles.caption12Semibold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConst.blueText,
                ),
              ),
              TextSpan(
                text: "setiap mengikuti kegiatan latihan!",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorConst.blue100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GetBuilder<JadwalController>(
        id: "calendarHeader",
        builder: (state) {
          return Row(
            children: [
              InkWell(
                onTap: state.previousMonth,
                child: Iconify(MaterialSymbols.arrow_back_ios,
                    color: Colors.white, size: 18.sp),
              ),
              const Spacer(),
              Text(
                state.focusedDay.toMonthYearString(),
                style: AppTextStyles.body14Bold.copyWith(color: Colors.white),
              ),
              const Spacer(),
              InkWell(
                onTap: state.nextMonth,
                child: Iconify(MaterialSymbols.arrow_forward_ios,
                    color: Colors.white, size: 18.sp),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCalendar() {
    return Obx(
      () =>
          controller.eventCalendar.value.whenOrNull(
            success: (data) => TableCalendar(
              focusedDay: controller.focusedDay,
              firstDay: controller.firstDay,
              lastDay: controller.lastDay,
              headerVisible: false,
              availableGestures: AvailableGestures.none,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: controller.onDaySelected,
              calendarBuilders: CustomCalendarBuilder.create(event: data),
            ),
          ) ??
          TableCalendar(
            focusedDay: controller.focusedDay,
            firstDay: controller.firstDay,
            lastDay: controller.lastDay,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarBuilders: CustomCalendarBuilder.create(
              event: List.generate(
                controller.focusedDay.getLastDayOfMonth(),
                (index) => CalendarEvent(
                  date: DateTime(
                    controller.focusedDay.year,
                    controller.focusedDay.month,
                    index + 1,
                  ),
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorConst.textColour100.withAlpha(50),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorConst.blue20,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildLegendItem(ColorConst.successMain, 'Jadwal Latihan'),
          _buildLegendItem(ColorConst.dangerMain, 'Jadwal Ujian'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.caption12Regular),
      ],
    );
  }

  Widget _buildDetailInformation() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Iconify(Pepicons.map, size: 22.sp),
              SizedBox(width: 8.w),
              Text("Detail Informasi", style: AppTextStyles.title16Regular),
            ],
          ),
          SizedBox(height: 16.h),
          _buildInformationCard(),
        ],
      ),
    );
  }

  Widget _buildInformationCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.dangerMain, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _buildInformationCardHeader(),
          _buildInformationCardBody(),
        ],
      ),
    );
  }

  Widget _buildInformationCardHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorConst.dangerMain,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: GetBuilder<JadwalController>(
        id: "informationHeader",
        builder: (state) {
          return Row(
            children: [
              Iconify(Mdi.map_marker, size: 16.sp, color: Colors.white),
              SizedBox(width: 8.w),
              Text(
                state.selectedEvent?.lokasi ?? "",
                style: AppTextStyles.caption12Semibold
                    .copyWith(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInformationCardBody() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.r)),
      ),
      child: GetBuilder<JadwalController>(
        id: "informationBody",
        builder: (state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  state.selectedEvent?.fotoLokasi ?? "",
                  width: 120.w,
                  height: (3 / 4 * 120).w,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image,
                      size: 80.sp,
                      color: ColorConst.textColour20,
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.selectedEvent?.kelas != null)
                      _buildDetailText("Kelas: ${state.selectedEvent?.kelas}"),
                    if (state.selectedEvent?.waktu != null)
                      _buildDetailText("Pukul: ${state.selectedEvent?.waktu}"),
                    if (state.selectedEvent?.materi != null)
                      _buildDetailText(
                          "Materi: ${state.selectedEvent?.materi}"),
                    if (state.selectedEvent?.pelatih != null)
                      _buildDetailText(
                          "Pelatih: ${state.selectedEvent?.pelatih}"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailText(String text) {
    return Text(
      text,
      style: AppTextStyles.caption12Regular,
    );
  }

  Widget _buildTrainingHistory() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Iconify(IconParkSolid.history_query, size: 22.sp),
              SizedBox(width: 8.w),
              Text("Riwayat Latihan", style: AppTextStyles.title16Regular),
              const Spacer(),
              Text(
                "Detail",
                style: AppTextStyles.caption12Bold
                    .copyWith(color: ColorConst.blue100),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildTrainingHistoryCard(),
        ],
      ),
    );
  }

  Widget _buildTrainingHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.blue100, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHistoryItem("Total Pertemuan", "13 Hari"),
          _buildHistoryDivider(),
          _buildHistoryItem("Izin", "3 Hari"),
          _buildHistoryDivider(),
          _buildHistoryItem("Hadir", "10 Hari"),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.caption12Semibold
              .copyWith(color: ColorConst.blue100),
        ),
        Text(
          value,
          style: AppTextStyles.title16Bold.copyWith(color: ColorConst.blue100),
        ),
      ],
    );
  }

  Widget _buildHistoryDivider() {
    return Container(
      width: 1.w,
      height: 32.h,
      color: ColorConst.blue100,
    );
  }
}
