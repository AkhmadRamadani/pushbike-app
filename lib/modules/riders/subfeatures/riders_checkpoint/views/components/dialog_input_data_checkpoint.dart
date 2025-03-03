import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_input_text_widget.dart';
import 'package:pushbike_app/core/widget/custom_reusable_dialog_widget.dart';
import 'package:pushbike_app/core/widget/unordered_list_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/controllers/detail_riders_checkpoint.controller.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/repositories/riders_checkpoint.repository.dart';

class DialogInputDataCheckpoint extends StatelessWidget {
  const DialogInputDataCheckpoint(
      {super.key, this.data, required this.kategori});
  final DatumRiderCheckpoint? data;
  final RidersCheckpointKategori kategori;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailRidersCheckpointController()..data = data);

    return CustomReusableDialogWidget(
      title: 'Input Data',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic Administration",
            style: AppTextStyles.caption12Regular.copyWith(
              color: ColorConst.textColour50,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Upload Foto Data",
            style: AppTextStyles.body14Regular.copyWith(
              color: ColorConst.textColour90,
            ),
          ),
          const SizedBox(height: 12),
          GetBuilder<DetailRidersCheckpointController>(
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
          Visibility(
            visible: kategori == RidersCheckpointKategori.hasilTest,
            child: Column(
              children: [
                const SizedBox(height: 12),
                CustomInputTextWidget(
                  label: 'Waktu',
                  hintText: 'Masukkan waktu (detik)',
                  controller: controller.waktuController,
                  fillColor: ColorConst.backgroundTextField,
                  textInputType: TextInputType.number,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          CustomInputTextWidget(
            label: 'Keterangan (Opsional)',
            hintText: 'Masukkan teks',
            controller: controller.keteranganController,
            fillColor: ColorConst.backgroundTextField,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 18),
          Text(
            "Detail Informasi",
            style: AppTextStyles.caption12Regular.copyWith(
              color: ColorConst.textColour80,
            ),
          ),
          GetBuilder<DetailRidersCheckpointController>(
            builder: (_) {
              return UnorderedListWidget(
                items: _.ketentuan,
                textStyle: AppTextStyles.caption12Regular.copyWith(
                  color: ColorConst.textColour80,
                ),
                separator: const SizedBox(height: 0),
              );
            },
          ),
          const SizedBox(height: 18),
          Visibility(
            visible: data?.tCheckpoint == null,
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
    );
  }
}
