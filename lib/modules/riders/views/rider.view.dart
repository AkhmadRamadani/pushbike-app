import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/riders/views/components/rider_info_card.component.dart';

class RiderView extends StatelessWidget {
  const RiderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: "Riders Info",
        leadingIcon: SizedBox.shrink(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.h),
          RiderInfoCardComponent(
            backgroundColor: ColorConst.orangeRiders,
            imageAsset: AssetConst.ilustrasiRiderCheckpoint,
            title: "Riders Checkpoint",
            description:
                "Yuk, semangat checkpoint berikutnya! Kumpulkan lebih banyak poinmu yaa!",
            textAlign: TextAlign.end,
            onTap: () {
              Get.toNamed(AppRoutes.ridersCheckpoint);
            },
          ),
          SizedBox(height: 16.h),
          RiderInfoCardComponent(
            backgroundColor: ColorConst.successBorder,
            imageAsset: AssetConst.ilustrasiRaceRecap,
            title: "Race Recap",
            description:
                "Jangan lupa masukkan semua data race kamu yaa, teruslah berlatih.",
            textAlign: TextAlign.start,
            isImageFirst: false,
            onTap: () {
              Get.toNamed(AppRoutes.raceRecap);
            },
          ),
          SizedBox(height: 16.h),
          RiderInfoCardComponent(
            backgroundColor: ColorConst.pinkRiders,
            imageAsset: AssetConst.ilustrasiDataDiriRiders,
            title: "Data Diri Riders",
            description:
                "Beritahu Kami tentang Kamu ya riders, supaya Kami bisa menganalisa Kamu.",
            textAlign: TextAlign.end,
            onTap: () {
              Get.toNamed(AppRoutes.profileRider);
            },
          ),
        ],
      ),
    );
  }
}
