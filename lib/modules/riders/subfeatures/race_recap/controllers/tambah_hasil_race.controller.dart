import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/helpers/ask_permission_helper.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/widget/drawer_content_choose_file_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/user_joined_event.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/repositories/race_recap.repository.dart';

class TambahHasilRaceController extends GetxController {
  static TambahHasilRaceController get to => Get.find();
  final RaceRecapRepository _raceRecapRepository = RaceRecapRepository();

  TextEditingController kategoriController = TextEditingController();
  TextEditingController podiumController = TextEditingController();
  TextEditingController eventController = TextEditingController();

  List<JoinedEvent> joinedEvents = [];
  List<String> kategori = [];
  List<String> listPodium = [];

  JoinedEvent? selectedEvent;
  String? selectedKatergori;
  String? selectedPodium;
  File? imageFile;

  @override
  void onReady() {
    super.onReady();
    getUserJoinedEvent();
  }

  Future<void> getUserJoinedEvent() async {
    try {
      DialogService.showLoading(
        barrierDismissible: true,
      );

      final res = await _raceRecapRepository.getRiderJoinedEvent();

      DialogService.closeLoading();

      if (res.statusCode == 200) {
        joinedEvents = res.data?.data?.joinedEvents ?? [];
        kategori = res.data?.data?.kategori ?? [];
        listPodium = res.data?.data?.listPodium ?? [];
      } else {
        joinedEvents = [];
        kategori = [];
        listPodium = [];
      }

      update();
    } catch (e) {
      DialogService.closeLoading();

      joinedEvents = [];
      kategori = [];
      listPodium = [];
    }
  }

  setSelectedEvent(JoinedEvent event) {
    selectedEvent = event;
    eventController.text = event.event?.judul ?? '';
    update();
  }

  setSelectedKategori(String kategori) {
    selectedKatergori = kategori;
    kategoriController.text = kategori;
    update();
  }

  setSelectedPodium(String podium) {
    selectedPodium = podium;
    podiumController.text = podium;
    update();
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
        title: 'Bukti File',
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
        cancel: TextButton(
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
    if (selectedEvent == null) {
      return 'Event tidak boleh kosong';
    }
    if (selectedKatergori == null) {
      return 'Kategori tidak boleh kosong';
    }
    if (selectedPodium == null) {
      return 'Podium tidak boleh kosong';
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
      var res = await _raceRecapRepository.postHasilEvent(
        eventId: selectedEvent?.event?.id ?? 0,
        kategori: selectedKatergori ?? '',
        podium: selectedPodium ?? '',
        foto: imageFile!,
      );

      DialogService.closeLoading();

      if (res.statusCode == 201) {
        Get.back();
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
