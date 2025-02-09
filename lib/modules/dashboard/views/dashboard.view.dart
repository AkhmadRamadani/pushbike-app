import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/custom_step_indicator_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:pushbike_app/modules/dashboard/views/components/custom_dashboard_clipper.dart';
import 'package:pushbike_app/modules/dashboard/views/components/custom_dashboard_ellipse_painter.dart';
import 'package:pushbike_app/modules/dashboard/views/components/custom_dashboard_shadow.dart';
import 'package:pushbike_app/modules/information/views/components/dashboard_information_section.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/floating_payment_component.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.to;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildPointsSection(),
                  Separator(
                    thickness: 8.h,
                    color: ColorConst.textColour10,
                  ),
                  _buildMenuGrid(),
                  Separator(
                    thickness: 8.h,
                    color: ColorConst.textColour10,
                  ),
                  const DashboardInformationSection(),
                ],
              ),
            ),
          ),
          _buildFloatingPaymentInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 360.h,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 360.h),
            painter: CustomDashboardShadow(),
          ),
          ClipPath(
            clipper: CustomCurveClipper(),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 360.h,
              decoration: const BoxDecoration(
                gradient: ColorConst.gradientBlueDashboard,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  _buildWelcomeMessage(),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.level);
                    },
                    child: _buildRankBadge(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () =>
                  DashboardController.to.userDataState.value.whenOrNull(
                    success: (data) => Visibility(
                      visible: data.komunitas?.logo != null,
                      child: Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            data.komunitas?.logo ?? "",
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                    ),
                    error: (error) => const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    loading: () => CustomShimmerWidget.buildShimmerWidget(
                      width: 48.w,
                      height: 48.w,
                      radius: 50.r,
                    ),
                  ) ??
                  const SizedBox(),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () =>
                      DashboardController.to.userDataState.value.whenOrNull(
                        success: (data) => Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome, ',
                                style: AppTextStyles.h222Regular.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: data.selectedRider?.panggilan ?? '',
                                style: AppTextStyles.h222Bold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        error: (error) => SizedBox(
                          width: 0.8.sw,
                          child: Expanded(
                            child: Text(
                              error,
                              style: AppTextStyles.h222Bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        loading: () => CustomShimmerWidget.buildShimmerWidget(
                          width: 200.w,
                          height: 16.h,
                        ),
                      ) ??
                      const SizedBox(),
                ),
                Obx(
                  () =>
                      DashboardController.to.userDataState.value.whenOrNull(
                        success: (data) => Text(
                          '${data.selectedRider?.gender == 1 ? "Girls" : "Boys"}, ${data.selectedRider?.tanggalLahir?.year}',
                          style: AppTextStyles.body14Bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        error: (error) => SizedBox(
                          width: 0.8.sw,
                          child: Expanded(
                            child: Text(
                              error,
                              style: AppTextStyles.body14Bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        loading: () => Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: CustomShimmerWidget.buildShimmerWidget(
                            width: 200.w,
                            height: 12.h,
                          ),
                        ),
                      ) ??
                      const SizedBox(),
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 4.h),
        //   child: Iconify(
        //     Carbon.notification,
        //     color: Colors.white,
        //     size: 22.sp,
        //   ),
        // ),
      ],
    );
  }

  Widget _buildRankBadge() {
    return Column(
      children: [
        SizedBox(
          width: 140.w,
          child: Obx(
            () =>
                DashboardController.to.userDataState.value.whenOrNull(
                  success: (data) => Image.network(
                    data.selectedRider?.level?.icon ?? "",
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
        ),
        Obx(
          () =>
              DashboardController.to.userDataState.value.whenOrNull(
                success: (data) => CustomPaint(
                  size: Size(140.w, 14.h),
                  painter: CustomDashboardEllipsePainter(),
                ),
              ) ??
              const SizedBox(),
        ),
      ],
    );
  }

  Widget _buildPointsSection() {
    return Column(
      children: [
        Column(
          children: [
            Obx(
              () =>
                  DashboardController.to.userDataState.value.whenOrNull(
                    success: (data) => Text(
                        data.selectedRider?.level?.nama ?? "-",
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
                  DashboardController.to.userDataState.value.whenOrNull(
                    success: (data) => Text(
                      "${data.selectedRider?.totalPoints} Poin",
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
        SizedBox(height: 12.h),
        Obx(
          () =>
              DashboardController.to.levelState.value.whenOrNull(
                success: (data) => Visibility(
                  visible: data.pointToNextLevel != null &&
                      data.pointToNextLevel! > 0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorConst.dangerMain,
                      borderRadius: BorderRadius.circular(50.r),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorConst.textColour10,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AssetConst.icCoin, width: 12.w),
                        SizedBox(width: 4.w),
                        Text(
                          "${data.pointToNextLevel} Poin Lagi!",
                          style:
                              AppTextStyles.captionLimited10Semibold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                  width: 200.w,
                  height: 24.h,
                ),
              ) ??
              const SizedBox(),
        ),
        SizedBox(height: 8.h),
        Obx(
          () =>
              DashboardController.to.levelState.value.whenOrNull(
                success: (data) => CustomStepIndicatorLevelWidget(
                  height: 28,
                  leftMargin: 24.w,
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
                  division: 1,
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
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: GetBuilder<DashboardController>(
        builder: (state) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1 / 1.2,
            ),
            itemCount: state.listMenu.length,
            itemBuilder: (context, index) {
              final item = state.listMenu[index];
              return GestureDetector(
                onTap: item.onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item.assetPath, width: 50.w),
                    const SizedBox(height: 8),
                    Text(
                      item.label,
                      style: AppTextStyles.caption12Regular.copyWith(
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFloatingPaymentInfo() {
    return Obx(
      () =>
          DashboardController.to.userDataState.value.whenOrNull(
            success: (data) => Visibility(
              visible: data.membership != null,
              replacement: const SizedBox(),
              child: FloatingPaymentComponent(
                data: data.membership ?? LocalRiderMembership(),
              ),
            ),
          ) ??
          const SizedBox(),
    );

    // return const FloatingPaymentComponent();
  }
}
