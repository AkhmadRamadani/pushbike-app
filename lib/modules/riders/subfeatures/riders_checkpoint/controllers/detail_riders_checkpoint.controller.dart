import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/ask_permission_helper.dart';
import 'package:pushbike_app/core/helpers/file_helper.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/widget/drawer_content_choose_file_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/controllers/riders_checkpoint.controller.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/repositories/riders_checkpoint.repository.dart';

class DetailRidersCheckpointController extends GetxController {
  DatumRiderCheckpoint? data;
  final RidersCheckpointRepository _ridersCheckpointRepository =
      RidersCheckpointRepository();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  File? imageFile;

  List<String> ketentuan = [];

  @override
  void onReady() async {
    super.onReady();
    await setInitialData();
  }

  Future<void> setInitialData() async {
    DialogService.showLoading(
      barrierDismissible: true,
    );

    if (data?.tCheckpoint != null) {
      keteranganController.text = data?.tCheckpoint?.keterangan ?? '';
      waktuController.text = data?.tCheckpoint?.time ?? '';
      imageFile = await FileHelper.urlToFile(data?.tCheckpoint?.buktiUrl ?? '');
    }

    ketentuan = [
      'Dapatkan tambahan +${data?.poin} poin',
      'Data tidak boleh di manipulasi',
    ];
    update();
    DialogService.closeLoading();
  }

  Future<void> selectImagePicker() async {
    final pickedFile = await checkGalleryPermission();
    if (pickedFile != null) {
      imageFile = pickedFile;
      update();
    }
  }

  Future<File?> checkGalleryPermission() async {
    return await AskPermissionHelper.storage(
      onGranted: () {
        return getImage();
      },
    );
  }

  Future<File?> getImage() async {
    var res = await showModalBottomSheet<File>(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 160.h,
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
                      'Pilih File',
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: const DrawerContentChooseFileWidget(
                sourceFiles: [
                  SourceFileEnum.gallery,
                  SourceFileEnum.camera,
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return res;
  }

  void dialogShowSelectedImage() {
    if (imageFile != null) {
      Get.defaultDialog(
        title: 'Bukti Pembayaran',
        content: Image.file(imageFile!),
        confirm: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: ColorConst.blue100,
            ),
          ),
        ),
        cancel: Visibility(
          visible: data?.tCheckpoint == null,
          replacement: const SizedBox(),
          child: TextButton(
            onPressed: () {
              imageFile = null;
              update();
              Get.back();
            },
            child: const Text(
              'Hapus',
              style: TextStyle(
                color: ColorConst.dangerMain,
              ),
            ),
          ),
        ),
      );
    }
  }

  void selectImage() {
    if (imageFile != null) {
      dialogShowSelectedImage();
    } else {
      selectImagePicker();
    }
  }

  String? validate() {
    if (keteranganController.text.isEmpty) {
      return 'Keterangan tidak boleh kosong';
    }
    if (imageFile == null) {
      return 'Bukti tidak boleh kosong';
    }
    return null;
  }

  Future<void> postCheckpoint() async {
    DialogService.showLoading(
      barrierDismissible: true,
    );

    try {
      var res = await _ridersCheckpointRepository.postCheckpoint(
        checkpointId: data?.id ?? 0,
        keterangan: keteranganController.text,
        waktu: int.tryParse(waktuController.text) ?? 0,
        image: imageFile,
      );

      DialogService.closeLoading();

      if (res.statusCode == 200) {
        Get.back();
        RidersCheckpointController.to.getRiderCheckpointBasic(isRefresh: true);
        RidersCheckpointController.to.getRiderCheckpointTest(isRefresh: true);
        DialogService.showDialogSuccess(
          title: 'Berhasil',
          description: 'Data berhasil disimpan',
        );
      } else {
        DialogService.showDialogProblem(
          title: 'Error',
          description: res.message ?? 'Unknown error occurred.',
        );
      }
    } catch (e) {
      DialogService.closeLoading();
      DialogService.showDialogProblem(
        title: 'Error',
        description: e.toString(),
      );
      return;
    }
  }

  saveCheckpoint() async {
    if (validate() == null) {
      await postCheckpoint();
    } else {
      DialogService.showDialogProblem(
        title: 'Error',
        description: validate() ?? 'Unknown error occurred.',
      );
    }
  }
}
