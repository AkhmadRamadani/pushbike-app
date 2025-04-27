import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/core/widget/auth/auth_background_stack_widget.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/modules/event/controllers/detail_event.controller.dart';
import 'package:pushbike_app/modules/event/enums/status_kolektifitas.enum.event.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailEventView extends StatelessWidget {
  const DetailEventView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailEventController());
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<DetailEventController>(
            builder: (state) {
              if (state.isLoading || state.data == null) {
                return AuthBackgroundStackWidget(
                  backgroundPath: AssetConst.loginBackground,
                  width: 1.sw,
                );
              }
              return AuthBackgroundStackWidget(
                backgroundPath: state.data?.data?.fotoUrl ?? "-",
                width: 1.sw,
                height: 1.sw,
              );
            },
          ),
          _buildContent(context, controller),
          GetBuilder<DetailEventController>(builder: (state) {
            return Visibility(
              visible: !state.isLoading,
              child: Visibility(
                visible: !(state.data?.data?.isRegistered ?? false),
                child: _buildBottomButton(controller),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, DetailEventController controller) {
    return Column(
      children: [
        Container(
          height: 0.45.sh,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Iconify(
              Ion.arrow_back_circle,
              color: Colors.white.withAlpha(204), // ~80% opacity
              size: 42.sp,
            ),
          ),
        ),
        // Main detail container
        Container(
          width: double.infinity,
          height: 0.55.sh,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: GetBuilder<DetailEventController>(builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 240.w,
                      height: 24.h,
                      radius: 50.r,
                    ),
                    child: _Badge(
                      text: (state.data?.data?.kategori ?? "")
                              .contains('internal')
                          ? "Event Internal"
                          : state.data?.data?.isKolektif == 1
                              ? "Pendaftaran Kolektif"
                              : "Pendaftaran Individu",
                    ),
                  ),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 240.w,
                      height: 18.h,
                      radius: 50.r,
                    ),
                    child: Text(
                      state.data?.data?.judul ?? "",
                      style: AppTextStyles.h320Semibold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 180.w,
                      height: 18.h,
                      radius: 50.r,
                    ),
                    child: _InfoRow(
                      icon: Majesticons.location_marker,
                      text: state.data?.data?.tempatRace ?? "",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 180.w,
                      height: 18.h,
                      radius: 50.r,
                    ),
                    child: _InfoRow(
                      icon: Mdi.calendar_month_outline,
                      text: state.data?.data?.tanggalRace
                              ?.toHumanReadableDateString() ??
                          "",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 180.w,
                      height: 18.h,
                      radius: 50.r,
                    ),
                    child: _InfoRow(
                      icon: Mdi.people,
                      text:
                          '${(state.data?.data?.peserta ?? []).length} Riders bergabung',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: 180.w,
                      height: 18.h,
                      radius: 50.r,
                    ),
                    child: _buildPointsReminder(state.data?.data?.poin ?? 0),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: !state.isLoading,
                          replacement: CustomShimmerWidget.buildShimmerWidget(
                            width: double.infinity,
                            height: 40.h,
                            radius: 50.r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const _SectionHeader(
                                  title: "Race Pack",
                                  color: ColorConst.dangerBorder),
                              SizedBox(height: 6.h),
                              Visibility(
                                visible: state.racePack.isNotEmpty,
                                replacement:
                                    Text("-", style: AppTextStyles.h320Regular),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final racePack = state.racePack[index];
                                    return _RacePackItem(
                                      label: racePack,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 6.h,
                                  ),
                                  itemCount: state.racePack.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: !state.isLoading,
                          replacement: CustomShimmerWidget.buildShimmerWidget(
                            width: double.infinity,
                            height: 40.h,
                            radius: 50.r,
                          ),
                          child: Text(
                            state.data?.data?.harga?.toRupiahWithFree() ?? "-",
                            style: AppTextStyles.h124Regular
                                .copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: double.infinity,
                      height: 40.h,
                      radius: 50.r,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        if (state.data?.data?.linkInformasi != null) {
                          if (await canLaunchUrl(Uri.parse(
                              state.data?.data?.linkInformasi ?? ""))) {
                            launchUrl(
                                Uri.parse(
                                    state.data?.data?.linkInformasi ?? ""),
                                mode: LaunchMode.externalApplication);
                          }
                        }
                      },
                      child: Column(
                        children: [
                          const _SectionHeader(
                              title: "Detail Informasi",
                              color: ColorConst.dangerBorder),
                          SizedBox(height: 6.h),
                          _InfoRow(
                            icon: Mdi.instagram,
                            text: state.data?.data?.linkInformasi ?? "",
                            iconSize: 16.sp,
                            textStyle: AppTextStyles.body14Regular.copyWith(
                              color: ColorConst.eventIconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Visibility(
                    visible: !state.isLoading,
                    replacement: CustomShimmerWidget.buildShimmerWidget(
                      width: double.infinity,
                      height: 40.h,
                      radius: 50.r,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionHeader(
                          title:
                              "Riders yang Berpartisipasi (${state.pesertaList.length} Riders)",
                          color: ColorConst.dangerBorder,
                        ),
                        SizedBox(height: 6.h),
                        Visibility(
                          visible: state.pesertaList.isNotEmpty,
                          replacement:
                              Text("-", style: AppTextStyles.h320Regular),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final peserta = state.pesertaList[index];
                              return _ParticipantItem(
                                assetPath: AssetConst.icCheckPembayaran,
                                label: peserta,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 6.h,
                            ),
                            itemCount: state.pesertaList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPointsReminder(int poin) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorConst.blue20,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Dapatkan minimal ",
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
                text: "untuk event yang diikuti!",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(DetailEventController controller) {
    return Positioned(
      bottom: 60,
      left: 24.w,
      right: 24.w,
      child: ElevatedButton(
        onPressed: () {
          controller.joinEvent();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: ColorConst.blue100,
          disabledBackgroundColor: ColorConst.textColour40,
        ),
        child: Text(
          'Bayar Race',
          style: AppTextStyles.h418Semibold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailEventController>(
      builder: (state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: state.getStatusKolektifitas().color,
            borderRadius: BorderRadius.circular(50.r),
          ),
          constraints: BoxConstraints(
            maxWidth: 160.w,
            maxHeight: 32.h,
            minWidth: 100.w,
          ),
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.captionLimited10Bold.copyWith(
                color: state.getStatusKolektifitas().textColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String icon;
  final String text;
  final double iconSize;
  final TextStyle? textStyle;

  const _InfoRow({
    required this.icon,
    required this.text,
    this.iconSize = 14,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Iconify(
          icon,
          color: ColorConst.eventIconColor,
          size: iconSize.sp,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: textStyle ??
              AppTextStyles.caption12Regular.copyWith(
                color: ColorConst.textColour80,
              ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 18.h,
          width: 8.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: color,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          title,
          style: AppTextStyles.title16Semibold,
        ),
      ],
    );
  }
}

class _RacePackItem extends StatelessWidget {
  final String label;
  const _RacePackItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetConst.icCheckPembayaran,
          width: 12.w,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.caption12Regular.copyWith(
              color: ColorConst.textColour70,
            ),
          ),
        ),
      ],
    );
  }
}

class _ParticipantItem extends StatelessWidget {
  final String assetPath;
  final String label;
  const _ParticipantItem({
    required this.assetPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 12.w,
        ),
        SizedBox(width: 8.w),
        Text(
          label,
          style: AppTextStyles.caption12Regular.copyWith(
            color: ColorConst.textColour70,
          ),
        ),
      ],
    );
  }
}
