import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/custom_tabbar_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/pembayaran/controllers/pembayaran.controller.dart';
import 'package:pushbike_app/modules/pembayaran/models/membership_model.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/membership_card_component.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/support_us_card.dart';

class PembayaranView extends StatelessWidget {
  const PembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PembayaranController>();

    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Pembayaran'),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Obx(
                  () =>
                      controller.membershipState.value.whenOrNull(
                        success: (data) => _buildMembershipList(data),
                        loading: () => _buildLoadingList(),
                        empty: (message) => SizedBox(
                          width: 1.sw,
                          child: GeneralEmptyErrorWidget(
                            descText: message,
                            onRefresh: controller.getMembershipList,
                            isCentered: true,
                          ),
                        ),
                        error: (message) => SizedBox(
                          width: 1.sw,
                          child: GeneralEmptyErrorWidget(
                            descText: message,
                            onRefresh: controller.getMembershipList,
                            isCentered: true,
                          ),
                        ),
                      ) ??
                      const SizedBox.shrink(),
                ),
                _buildSupportUsSection(),
              ],
            ),
          ),
        ],
      ),
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
          height: 180.h,
          radius: 16.r,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox.shrink(),
    );
  }

  Widget _buildTabBar(PembayaranController controller) {
    return CustomTabbarWidget(
      tabController: controller.tabController!,
      tabs: const [
        Tab(text: 'Iuran'),
        Tab(text: 'Support Us'),
      ],
    );
  }

  Widget _buildMembershipList(List<MembershipModel> memberships) {
    return RefreshIndicator(
      onRefresh: () async {
        await PembayaranController.to.getMembershipList();
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: memberships.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final membership = memberships[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                AppRoutes.pembayaranDetail,
                arguments: memberships[index],
              );
            },
            child: MembershipCardComponent(
              membership: membership,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }

  Widget _buildSupportUsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          SizedBox(height: 24.h),
          Column(
            children: [
              Text(
                  "Hello, ${PembayaranController.to.localUserData?.selectedRider?.panggilan ?? "Rider"}!",
                  style: AppTextStyles.h320Semibold),
              Text(
                  '${PembayaranController.to.localUserData?.selectedRider?.gender == 1 ? "Girls" : "Boys"}, ${PembayaranController.to.localUserData?.selectedRider?.tanggalLahir?.year}',
                  style: AppTextStyles.title16Regular),
            ],
          ),
          SizedBox(height: 16.h),
          const SupportUsCard(),
          SizedBox(height: 16.h),
          _buildPointsReminder(),
          SizedBox(height: 16.h),
          Text(
            "Kami akan sangat berterima kasih atas support yang Anda berikan. Support dari Anda akan Kami gunakan untuk mengembangkan aplikasi ini menjadi lebih baik.",
            style: AppTextStyles.body14Regular,
          ),
          SizedBox(height: 16.h),
          _buildAdditionalInfo(),
          SizedBox(height: 36.h),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.pembayaranPay,
                arguments: {
                  'tipe': 'Support',
                },
              );
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
              'Support Us',
              style: AppTextStyles.h418Semibold.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsReminder() {
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
                text: "Dapatkan tambahan ",
                style: AppTextStyles.caption12Regular,
              ),
              TextSpan(
                text: "+10 Poin ",
                style: AppTextStyles.caption12Semibold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConst.blueText,
                ),
              ),
              TextSpan(
                text: "untuk setiap donasi!",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ColorConst.green20,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Iconify(
                MaterialSymbols.warning_rounded,
                color: ColorConst.dangerMain,
                size: 18.sp,
              ),
              const SizedBox(width: 4),
              Text(
                "Informasi Tambahan",
                style: AppTextStyles.caption12Semibold,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Setiap Wali Riders tidak wajib membayarkan donasi untuk pengembangan aplikasi.",
            style: AppTextStyles.caption12Regular,
          ),
        ],
      ),
    );
  }
}
