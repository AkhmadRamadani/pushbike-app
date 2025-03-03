import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/controllers/tambah_hasil_race.controller.dart';

class TambahHasilRaceDialog extends StatelessWidget {
  const TambahHasilRaceDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TambahHasilRaceController());

    return Column(
      children: [
        CustomInputTextWidget(
          label: 'Event',
          hintText: 'Pilih event',
          fillColor: ColorConst.backgroundTextField,
          enabled: true,
          controller: controller.eventController,
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 400.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: ColorConst.blue100,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Pilih Event',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      color: Colors.white,
                      height: 300.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.joinedEvents.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: ColorConst.textColour10,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                controller.joinedEvents[index].event?.judul ??
                                    "-"),
                            onTap: () {
                              controller.setSelectedEvent(
                                controller.joinedEvents[index],
                              );
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.info,
              color: ColorConst.dangerMain,
              size: 14.sp,
            ),
            const SizedBox(width: 4),
            Text(
              "Jika race tidak terdaftar segera hubungi admin",
              style: AppTextStyles.caption12Regular.copyWith(
                color: ColorConst.dangerMain,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomInputTextWidget(
                label: "Kategori",
                hintText: "Pilih kategori",
                fillColor: ColorConst.backgroundTextField,
                enabled: true,
                controller: controller.kategoriController,
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 48.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: ColorConst.blue100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Pilih Kategori',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            color: Colors.white,
                            height: 300.h,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.kategori.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: ColorConst.textColour10,
                              ),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.kategori[index]),
                                  onTap: () {
                                    controller.setSelectedKategori(
                                      controller.kategori[index],
                                    );
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomInputTextWidget(
                label: "Podium",
                hintText: "Pilih podium",
                fillColor: ColorConst.backgroundTextField,
                enabled: true,
                controller: controller.podiumController,
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 48.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: ColorConst.blue100,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Pilih Podium',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            color: Colors.white,
                            height: 300.h,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.listPodium.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: ColorConst.textColour10,
                              ),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.listPodium[index]),
                                  onTap: () {
                                    controller.setSelectedPodium(
                                      controller.listPodium[index],
                                    );
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GetBuilder<TambahHasilRaceController>(
          builder: (state) {
            return GestureDetector(
              onTap: () => state.selectImage(),
              child: Container(
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                  color: ColorConst.backgroundTextField,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: ColorConst.textColour20,
                  ),
                ),
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) =>
                      state.imageFile != null,
                  widgetBuilder: (BuildContext context) => ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.file(
                      state.imageFile!,
                      width: double.infinity,
                      height: 180.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  fallbackBuilder: (BuildContext context) => Center(
                    child: Image.asset(
                      AssetConst.ionImageOutline,
                      width: 32.w,
                      height: 32.w,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: ColorConst.textColour40,
                ),
                child: Text(
                  'Tutup',
                  style: AppTextStyles.h418Semibold.copyWith(
                    color: ColorConst.blue100,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.saveCheckpoint();
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
                  'Simpan',
                  style: AppTextStyles.h418Semibold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
