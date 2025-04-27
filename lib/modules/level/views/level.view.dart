import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/auth/auth_background_stack_widget.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/custom_step_indicator_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/dashboard/views/components/custom_dashboard_ellipse_painter.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:pushbike_app/modules/level/controllers/level.controller.dart';
import 'package:pushbike_app/modules/point/views/components/point_card.component.dart';

class LevelView extends StatelessWidget {
  const LevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              AuthBackgroundStackWidget(
                backgroundPath: AssetConst.levelBackgroundPattern,
                width: 1.sw,
                top: 0,
                expandedContentSize: 4,
              ),
              SafeArea(
                child: Column(
                  children: [
                    // Top Illustration
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Container(
                            width: 300.w,
                            height: 300.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AssetConst.levelBackground),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: _buildRankBadge(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 0.45.sh,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 48.h,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Iconify(
                    Ion.arrow_back_circle,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 42.sp,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.55.sh,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: RefreshIndicator(
                  onRefresh: () => LevelController.to.refreshData(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      _buildPointsSection(),
                      SizedBox(height: 32.h),
                      _buildRiwayatPoin(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRiwayatPoin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Riwayat Perolehan Poin",
                style: AppTextStyles.h418Bold,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.point,
                  );
                },
                child: Text(
                  "Lihat Semua",
                  style: AppTextStyles.caption12Semibold.copyWith(
                    color: ColorConst.blue100,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 24.h),
          Obx(
            () =>
                LevelController.to.listRiderHistoryPoints.value.whenOrNull(
                  success: (data) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = data.data![index];
                      return PointCardComponent(item: item);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 6.h),
                    itemCount: data.data?.length ?? 0,
                  ),
                  error: (error) => GeneralEmptyErrorWidget(
                    customUrlImage: AssetConst.drawEmptyWidget,
                    titleText: 'Riwayat Poin Kosong',
                    descText: error,
                    additionalWidgetBellowTextDesc: InkWell(
                      onTap: () {
                        LevelController.to
                            .getRiderHistoryPoints(isRefresh: true);
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
                  loading: () => CustomShimmerWidget.buildShimmerWidget(
                    width: 1.sw,
                    height: 200.h,
                  ),
                  empty: (message) => GeneralEmptyErrorWidget(
                    customUrlImage: AssetConst.drawEmptyWidget,
                    titleText: 'Riwayat Poin Kosong',
                    descText: message,
                    additionalWidgetBellowTextDesc: InkWell(
                      onTap: () {
                        LevelController.to
                            .getRiderHistoryPoints(isRefresh: true);
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
                ) ??
                const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildRankBadge() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () =>
                  LevelController.to.levelState.value.whenOrNull(
                    success: (data) => Image.network(
                      data.level?.iconUrl ?? '',
                      width: 160.w,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Iconify(Carbon.warning);
                      },
                    ),
                    loading: () => Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                      child: CustomShimmerWidget.buildShimmerWidget(
                        width: 140.w,
                        height: 140.h,
                      ),
                    ),
                  ) ??
                  const SizedBox(),
            ),
            SizedBox(height: 12.h),
            Obx(
              () =>
                  LevelController.to.levelState.value.whenOrNull(
                    success: (data) => CustomPaint(
                      size: Size(140.w, 14.h),
                      painter: CustomDashboardEllipsePainter(),
                    ),
                  ) ??
                  const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Obx(
                () =>
                    LevelController.to.levelState.value.whenOrNull(
                      success: (data) => Text(data.level?.nama ?? '',
                          style: AppTextStyles.h222Semibold),
                      error: (error) => Text(
                        error,
                        style: AppTextStyles.h222Semibold,
                      ),
                      loading: () => CustomShimmerWidget.buildShimmerWidget(
                        width: 200.w,
                        height: 24.h,
                      ),
                    ) ??
                    const SizedBox(),
              ),
              Obx(
                () =>
                    LevelController.to.levelState.value.whenOrNull(
                      success: (data) => Text(
                        "${data.currentPoint ?? 0} Poin",
                        style: AppTextStyles.title16Regular,
                      ),
                      error: (error) => Text(
                        error,
                        style: AppTextStyles.title16Regular,
                      ),
                      loading: () => CustomShimmerWidget.buildShimmerWidget(
                        width: 200.w,
                        height: 24.h,
                      ),
                    ) ??
                    const SizedBox(),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Obx(
          () =>
              LevelController.to.levelState.value.whenOrNull(
                success: (data) => CustomStepIndicatorLevelWidget(
                  height: 28,
                  leftMargin: 24,
                  paddingLine: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  positiveColor: ColorConst.blue100,
                  progressColor: ColorConst.blue100,
                  negativeColor: ColorConst.blue20,
                  positiveCheck: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: ColorConst.blue100,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: ColorConst.blue20,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  list: data.allLevels ?? [],
                  division: 2,
                  onChange: (i) {},
                  page: data.currentPage ?? 0,
                ),
                error: (error) => Text(
                  error,
                  style: AppTextStyles.captionLimited10Semibold.copyWith(
                    color: Colors.white,
                  ),
                ),
                loading: () => CustomShimmerWidget.buildShimmerWidget(
                  width: 1.sw,
                  height: 32.h,
                ),
              ) ??
              const SizedBox(),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Obx(
            () =>
                LevelController.to.levelState.value.whenOrNull(
                  success: (data) => Visibility(
                    visible: data.nextLevel != null,
                    child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConst.blue20,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: "Yuk, raih ",
                          style: AppTextStyles.caption12Regular.copyWith(),
                          children: [
                            TextSpan(
                              text: "${data.pointToNextLevel ?? 0} Poin",
                              style: AppTextStyles.caption12Bold.copyWith(
                                color: ColorConst.blue100,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " untuk naik level ke ${data.nextLevel?.nama ?? ""}!",
                              style: AppTextStyles.caption12Regular,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  error: (error) => Text(
                    error,
                    style: AppTextStyles.captionLimited10Semibold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  loading: () => CustomShimmerWidget.buildShimmerWidget(
                    width: 1.sw,
                    height: 32.h,
                  ),
                ) ??
                const SizedBox(),
          ),
        ),
      ],
    );
  }
}
