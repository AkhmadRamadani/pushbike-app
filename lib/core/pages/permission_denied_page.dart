import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';

class PermissionDeniedPage extends StatelessWidget {
  final String? desc;
  final String type;

  const PermissionDeniedPage.camera({
    super.key,
    this.desc,
  }) : type = 'camera';
  const PermissionDeniedPage.contact({
    super.key,
    this.desc,
  }) : type = 'contact';
  const PermissionDeniedPage.media({
    super.key,
    this.desc,
  }) : type = 'media';
  const PermissionDeniedPage.location({
    super.key,
    this.desc,
  }) : type = 'location';

  @override
  Widget build(BuildContext context) {
    String getTitle() {
      Map<String, String> data = {
        'camera': 'Izinkan akses kamera',
        'media': 'Izinkan akses media',
        'contact': 'Izinkan akses kontak',
      };
      return data[type] ?? 'Izinkan akses pada smartphone anda';
    }

    String getIllusPath() {
      Map<String, String> data = {
        'camera': AssetConst.drawAskPermissionCamera,
        'media': AssetConst.drawAskPermissionMedia,
        'contact': AssetConst.drawAskPermissionContact,
        'location': AssetConst.drawAskPermissionLocation,
      };
      return data[type] ?? 'Izinkan akses pada smartphone anda';
    }

    String getDesc() {
      Map<String, String> data = {
        'camera':
            'Segera aktifikan permission kamera kamu\nagar bisa menggunakan fitur ini',
        'media':
            'Segera aktifikan permission media kamu\nagar bisa menggunakan fitur ini',
        'contact':
            'Segera aktifikan permission kontak kamu\nagar bisa menggunakan fitur ini',
        'location':
            'Segera aktifikan permission lokasi kamu\nagar bisa menggunakan fitur ini',
      };
      return desc ?? data[type] ?? 'Izinkan akses pada smartphone anda';
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Text(
                getTitle(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                getDesc(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Image.asset(
                getIllusPath(),
                height: 221.h,
                fit: BoxFit.fitHeight,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: GestureDetector(
                  onTap: () {
                    Get.back();

                    openAppSettings();
                  },
                  child: Container(
                    width: 1.sw,
                    height: 48,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: ColorConst.blue50,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: const Center(
                      child: Text(
                        'Lanjutkan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 1.sw,
                    height: 48,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: ColorConst.blue50,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Kembali',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.blue50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
