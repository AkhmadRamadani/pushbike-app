import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/controllers/edit_profile_rider.controller.dart';

class EditProfileRiderView extends StatelessWidget {
  const EditProfileRiderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileRiderController());
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Profil Riders'),
      backgroundColor: ColorConst.blue20,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Center(
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
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                RiderTab(),
                SepedaTab(),
                WaliTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RiderTab extends StatelessWidget {
  const RiderTab({super.key});

  Widget _buildImageWidget(EditProfileRiderController controller) {
    if (controller.riderImage != null) {
      if (controller.riderImage is File) {
        return Image.file(controller.riderImage, fit: BoxFit.cover);
      } else if (controller.riderImage is String) {
        return Image.network(controller.riderImage, fit: BoxFit.cover);
      }
    }
    // Jika belum ada gambar, tampilkan placeholder
    return Center(
      child: Image.asset(
        AssetConst.ionImageOutline,
        width: 32.w,
        height: 32.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileRiderController>();
    return GetBuilder<EditProfileRiderController>(builder: (state) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConst.backgroundProfileWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto Rider",
                style: AppTextStyles.body14Regular.copyWith(
                  color: ColorConst.textColour90,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => controller.pickRiderImage(),
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: ColorConst.backgroundTextField,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: ColorConst.textColour20),
                  ),
                  child: _buildImageWidget(controller),
                ),
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap',
                controller: controller.riderNamaLengkapController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Panggilan',
                hintText: 'Masukkan panggilan',
                controller: controller.riderPanggilanController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Julukan',
                hintText: 'Masukkan julukan',
                controller: controller.riderJulukanController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Tanggal Lahir',
                hintText: 'YYYY-MM-DD',
                controller: controller.riderTanggalLahirController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Domisili',
                hintText: 'Masukkan domisili',
                controller: controller.riderDomisiliController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Tinggi Badan',
                hintText: 'Masukkan tinggi badan',
                controller: controller.riderTinggiBadanController,
                textInputType: TextInputType.number,
              ),
              // ... Field-field lainnya
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => controller.updateRiderProfile(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: ColorConst.blue100,
                ),
                child: Text(
                  'Simpan',
                  style:
                      AppTextStyles.h418Semibold.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SepedaTab extends StatelessWidget {
  const SepedaTab({super.key});

  Widget _buildImageWidget(EditProfileRiderController controller) {
    if (controller.sepedaImage != null) {
      if (controller.sepedaImage is File) {
        return Image.file(controller.sepedaImage, fit: BoxFit.cover);
      } else if (controller.sepedaImage is String) {
        return Image.network(controller.sepedaImage, fit: BoxFit.cover);
      }
    }
    return Center(
      child: Image.asset(
        AssetConst.ionImageOutline,
        width: 32.w,
        height: 32.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileRiderController>();
    return GetBuilder<EditProfileRiderController>(builder: (state) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConst.backgroundProfileWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto Sepeda",
                style: AppTextStyles.body14Regular.copyWith(
                  color: ColorConst.textColour90,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => controller.pickSepedaImage(),
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: ColorConst.backgroundTextField,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: ColorConst.textColour20),
                  ),
                  child: _buildImageWidget(controller),
                ),
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Frame',
                hintText: 'Masukkan frame sepeda',
                controller: controller.sepedaFrameController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'As To As Roda',
                hintText: 'Masukkan as to as roda',
                controller: controller.sepedaAsToAsRodaController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Helm',
                hintText: 'Masukkan helm',
                controller: controller.sepedaHelmController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Panjang Stem',
                hintText: 'Masukkan panjang stem',
                controller: controller.sepedaPanjangStemController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Panjang Stang',
                hintText: 'Masukkan panjang stang',
                controller: controller.sepedaPanjangStangController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Diameter Stang',
                hintText: 'Masukkan diameter stang',
                controller: controller.sepedaDiameterStangController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Tinggi Sadel',
                hintText: 'Masukkan tinggi sadel',
                controller: controller.sepedaTinggiSadelController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Stem to Stem',
                hintText: 'Masukkan stem to stem',
                controller: controller.sepedaStemToStemController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => controller.updateSepedaProfile(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: ColorConst.blue100,
                ),
                child: Text(
                  'Simpan',
                  style:
                      AppTextStyles.h418Semibold.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class WaliTab extends StatelessWidget {
  const WaliTab({super.key});

  Widget _buildImageWidget(EditProfileRiderController controller) {
    if (controller.waliImage != null) {
      if (controller.waliImage is File) {
        return Image.file(controller.waliImage, fit: BoxFit.cover);
      } else if (controller.waliImage is String) {
        return Image.network(controller.waliImage, fit: BoxFit.cover);
      }
    }
    return Center(
      child: Image.asset(
        AssetConst.ionImageOutline,
        width: 32.w,
        height: 32.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileRiderController>();
    return GetBuilder<EditProfileRiderController>(builder: (state) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConst.backgroundProfileWhite,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto Wali Rider",
                style: AppTextStyles.body14Regular.copyWith(
                  color: ColorConst.textColour90,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => controller.pickWaliImage(),
                child: Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: ColorConst.backgroundTextField,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: ColorConst.textColour20),
                  ),
                  child: _buildImageWidget(controller),
                ),
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Nama Mama',
                hintText: 'Masukkan nama mama',
                controller: controller.waliNamaMamaController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Telp Mama',
                hintText: 'Masukkan telp mama',
                controller: controller.waliTelpMamaController,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Nama Papa',
                hintText: 'Masukkan nama papa',
                controller: controller.waliNamaPapaController,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Email Akun',
                hintText: 'Masukkan email akun',
                controller: controller.waliEmailAkunController,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              CustomInputTextWidget(
                label: 'Alamat',
                hintText: 'Masukkan alamat',
                controller: controller.waliAlamatController,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => controller.updateWaliProfile(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: ColorConst.blue100,
                ),
                child: Text(
                  'Simpan',
                  style:
                      AppTextStyles.h418Semibold.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
