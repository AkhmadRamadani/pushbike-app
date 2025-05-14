import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/controllers/profile_rider.controller.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/rider_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/sepeda_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/wali_data_update.model.dart';

class ProfileRiderView extends StatelessWidget {
  const ProfileRiderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileRiderController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.blue100,
        toolbarHeight: 0,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          GetBuilder<ProfileRiderController>(builder: (state) {
            return TabBarView(
              controller: state.tabController,
              children: [
                _riderProfile(state.riderData),
                _sepedaProfile(state.sepedaData),
                _waliProfile(state.waliData),
              ],
            );
          }),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: const GeneralAppBarWidget(
              title: 'Profil Riders',
            ),
          ),
          Positioned(
            top: 72.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 0.88.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  labelColor: ColorConst.blue100,
                  labelStyle: AppTextStyles.body14Regular.copyWith(
                    color: ColorConst.blue100,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: AppTextStyles.body14Regular.copyWith(
                    color: ColorConst.textColour50,
                    fontWeight: FontWeight.w600,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  splashBorderRadius: BorderRadius.circular(50.r),
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Rider'),
                    Tab(text: 'Sepeda'),
                    Tab(text: 'Wali Rider'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: GestureDetector(
              onTap: () async {
                await Get.toNamed(
                  AppRoutes.editProfileRider,
                  arguments: {
                    'riderData': controller.riderData,
                    'sepedaData': controller.sepedaData,
                    'waliData': controller.waliData,
                  },
                );
                controller.getInitialData();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 16.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConst.blue100,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        child: Text(
                          "Edit Profil",
                          style: AppTextStyles.body14Semibold.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _riderProfile(RiderDataUpdateModel? data) {
    return _profileWidget(
      title: "Biodata Rider",
      imageUrl: data?.fotoRider?.toString(),
      data: [
        _listItemData("Nama Lengkap", data?.namaLengkap ?? "-"),
        _listItemData("Panggilan", data?.panggilan ?? "-"),
        _listItemData("Julukan “Alias”", data?.julukan ?? "-"),
        _listItemData("Tanggal Lahir", data?.tanggalLahir ?? "-"),
        _listItemData("Domisili", data?.domisili ?? "-"),
        _listItemData("Tinggi Badan", "${data?.tinggiBadan ?? "0"} cm"),
        _listItemData("Panjang Kaki", "${data?.panjangKaki ?? "0"} cm"),
        _listItemData("Panjang Lengan", "${data?.panjangLengan ?? "0"} cm"),
        _listItemData("Lingkar Kepala", "${data?.lingkarKepala ?? "0"} cm"),
        _listItemData("Ukuran Sepatu", "${data?.ukuranSepatu ?? "0"} cm"),
        _listItemData("Nomor Plat", data?.nomorPlat ?? "-"),
        _listItemData("Warna Official", data?.warnaOfficial ?? "-"),
      ],
    );
  }

  Widget _sepedaProfile(SepedaDataUpdateModel? data) {
    return _profileWidget(
      title: "Detail Sepeda",
      imageUrl: data?.fotoSepeda,
      data: [
        _listItemData("Frame", data?.frame ?? "-"),
        _listItemData("As to As Roda", "${data?.asToAsRoda ?? "0"} mm"),
        _listItemData("Helm", data?.helm ?? "-"),
        _listItemData("Panjang Stem", "${data?.panjangStem ?? "0"} mm"),
        _listItemData("Panjang Stang", "${data?.panjangStang ?? "0"} mm"),
        _listItemData("Diameter Stang", "${data?.diameterStang ?? "0"} mm"),
        _listItemData("Tinggi Sadel", "${data?.tinggiSadel ?? "0"} mm"),
        _listItemData("Stem to Stem", "${data?.stemToStem ?? "0"} mm"),
      ],
    );
  }

  Widget _waliProfile(WaliDataUpdateModel? data) {
    return _profileWidget(
      title: "Biodata Wali",
      imageUrl: data?.fotoProfile,
      data: [
        _listItemData("Nama Mama", data?.namaMama ?? "-"),
        _listItemData("No. Telepon", data?.telpMama ?? "-"),
        _listItemData("Nama Papa", data?.namaPapa ?? "-"),
        _listItemData("Email Akun", data?.emailAkun ?? "-"),
        _listItemData("Alamat", data?.alamat ?? "-"),
        _listItemData(
            "Kartu Keluarga", data?.fileKk != null ? "Terlampir" : "-"),
        _listItemData("Akta Anak", data?.fileAkte != null ? "Terlampir" : "-"),
        _listItemData("KIA", data?.fileKia != null ? "Terlampir" : "-"),
      ],
    );
  }

  Widget _profileWidget({
    required String title,
    String? imageUrl,
    required List<Widget> data,
  }) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                height: 0.55.sh,
                child: Image.network(
                  imageUrl ??
                      "https://placehold.co/600x1200/png?text=loading....",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.3.sh,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            width: double.infinity,
            height: 0.48.sh,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 0.45.sh,
                    decoration: const BoxDecoration(
                      color: ColorConst.blue20,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.35.sh,
                          decoration: const BoxDecoration(
                            color: ColorConst.backgroundProfileWhite,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          padding: EdgeInsets.all(16.w),
                          child: SingleChildScrollView(
                            child: Column(
                              children: data,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConst.blue100,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Text(
                        title,
                        style: AppTextStyles.body14Semibold.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _listItemData(String key, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              key,
              style: AppTextStyles.body14Regular,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
            ),
            child: Text(
              ":",
              style: AppTextStyles.body14Regular,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
