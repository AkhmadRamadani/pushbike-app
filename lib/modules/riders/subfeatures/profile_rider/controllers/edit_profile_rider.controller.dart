import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/helpers/ask_permission_helper.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/widget/drawer_content_choose_file_widget.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/rider_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/sepeda_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/wali_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/repositories/profile_rider.repository.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/responses/update_rider.response.model.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';

class EditProfileRiderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ProfileRiderRepository _profileRiderRepository =
      ProfileRiderRepository();

  // Data awal dari API
  RiderDataUpdateModel? riderData;
  SepedaDataUpdateModel? sepedaData;
  WaliDataUpdateModel? waliData;

  // TextEditingController untuk tab Rider
  final riderNamaLengkapController = TextEditingController();
  final riderPanggilanController = TextEditingController();
  final riderJulukanController = TextEditingController();
  final riderTanggalLahirController = TextEditingController();
  final riderDomisiliController = TextEditingController();
  final riderTinggiBadanController = TextEditingController();
  final riderPanjangKakiController = TextEditingController();
  final riderPanjangLenganController = TextEditingController();
  final riderLingkarKepalaController = TextEditingController();
  final riderUkuranSepatuController = TextEditingController();
  final riderNomorPlatController = TextEditingController();
  final riderWarnaOfficialController = TextEditingController();
  // Gambar Rider, bisa berupa URL (String) atau File (hasil picker)
  dynamic riderImage;

  // TextEditingController untuk tab Sepeda
  final sepedaFrameController = TextEditingController();
  final sepedaAsToAsRodaController = TextEditingController();
  final sepedaHelmController = TextEditingController();
  final sepedaPanjangStemController = TextEditingController();
  final sepedaPanjangStangController = TextEditingController();
  final sepedaDiameterStangController = TextEditingController();
  final sepedaTinggiSadelController = TextEditingController();
  final sepedaStemToStemController = TextEditingController();
  dynamic sepedaImage;

  // TextEditingController untuk tab Wali
  final waliNamaMamaController = TextEditingController();
  final waliTelpMamaController = TextEditingController();
  final waliNamaPapaController = TextEditingController();
  final waliEmailAkunController = TextEditingController();
  final waliAlamatController = TextEditingController();
  dynamic waliImage;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    final args = Get.arguments;
    if (args != null) {
      riderData = args['riderData'] as RiderDataUpdateModel?;
      sepedaData = args['sepedaData'] as SepedaDataUpdateModel?;
      waliData = args['waliData'] as WaliDataUpdateModel?;
      _initializeControllers();
    } else {
      Get.back();
    }
    super.onInit();
  }

  void _initializeControllers() {
    // Inisialisasi data Rider
    if (riderData != null) {
      riderNamaLengkapController.text = riderData?.namaLengkap ?? '';
      riderPanggilanController.text = riderData?.panggilan ?? '';
      riderJulukanController.text = riderData?.julukan ?? '';
      riderTanggalLahirController.text = riderData?.tanggalLahir ?? '';
      riderDomisiliController.text = riderData?.domisili ?? '';
      riderTinggiBadanController.text =
          riderData?.tinggiBadan?.toString() ?? '';
      riderPanjangKakiController.text =
          riderData?.panjangKaki?.toString() ?? '';
      riderPanjangLenganController.text =
          riderData?.panjangLengan?.toString() ?? '';
      riderLingkarKepalaController.text =
          riderData?.lingkarKepala?.toString() ?? '';
      riderUkuranSepatuController.text =
          riderData?.ukuranSepatu?.toString() ?? '';
      riderNomorPlatController.text = riderData?.nomorPlat ?? '';
      riderWarnaOfficialController.text = riderData?.warnaOfficial ?? '';
      // Simpan data gambar awal (biasanya berupa URL)
      riderImage = riderData?.fotoRider;
    }

    // Inisialisasi data Sepeda
    if (sepedaData != null) {
      sepedaFrameController.text = sepedaData?.frame ?? '';
      sepedaAsToAsRodaController.text = sepedaData?.asToAsRoda ?? '';
      sepedaHelmController.text = sepedaData?.helm ?? '';
      sepedaPanjangStemController.text = sepedaData?.panjangStem ?? '';
      sepedaPanjangStangController.text = sepedaData?.panjangStang ?? '';
      sepedaDiameterStangController.text = sepedaData?.diameterStang ?? '';
      sepedaTinggiSadelController.text = sepedaData?.tinggiSadel ?? '';
      sepedaStemToStemController.text = sepedaData?.stemToStem ?? '';
      sepedaImage = sepedaData?.fotoSepeda;
    }

    // Inisialisasi data Wali
    if (waliData != null) {
      waliNamaMamaController.text = waliData?.namaMama ?? '';
      waliTelpMamaController.text = waliData?.telpMama ?? '';
      waliNamaPapaController.text = waliData?.namaPapa ?? '';
      waliEmailAkunController.text = waliData?.emailAkun ?? '';
      waliAlamatController.text = waliData?.alamat ?? '';
      waliImage = waliData?.fotoProfile;
    }
  }

  // --- Image Picker Functions ---

  // Fungsi generik untuk memilih gambar
  Future<File?> _selectImage() async {
    // Contoh memanggil fungsi permission dan image picker (silakan sesuaikan implementasinya)
    final pickedFile = await checkGalleryPermission();
    return pickedFile;
  }

  // Contoh implementasi checkGalleryPermission
  Future<File?> checkGalleryPermission() async {
    return await AskPermissionHelper.storage(
      onGranted: () {
        return getImage();
      },
    );
  }

  // showDatePicker
  Future<DateTime?> showDatePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return selectedDate;
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
              padding: EdgeInsets.symmetric(vertical: 16.h),
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

  Future<void> pickRiderImage() async {
    File? file = await _selectImage();
    if (file != null) {
      riderImage = file;
      update();
    }
  }

  Future<void> pickSepedaImage() async {
    File? file = await _selectImage();
    if (file != null) {
      sepedaImage = file;
      update();
    }
  }

  Future<void> pickWaliImage() async {
    File? file = await _selectImage();
    if (file != null) {
      waliImage = file;
      update();
    }
  }

  Future<void> updateRiderProfile() async {
    RiderDataUpdateModel newData = RiderDataUpdateModel(
      id: riderData?.id,
      waliId: riderData?.waliId,
      namaLengkap: riderNamaLengkapController.text,
      panggilan: riderPanggilanController.text,
      julukan: riderJulukanController.text,
      tanggalLahir: riderTanggalLahirController.text,
      domisili: riderDomisiliController.text,
      tinggiBadan: int.tryParse(riderTinggiBadanController.text),
      panjangKaki: int.tryParse(riderPanjangKakiController.text),
      panjangLengan: int.tryParse(riderPanjangLenganController.text),
      lingkarKepala: int.tryParse(riderLingkarKepalaController.text),
      ukuranSepatu: riderUkuranSepatuController.text,
      nomorPlat: riderNomorPlatController.text,
      warnaOfficial: riderWarnaOfficialController.text,
      fotoRider: riderImage,
    );

    ResponseModelAbstraction<UpdateRiderResponseModel> response =
        await _profileRiderRepository.updateRider(
      oldData: riderData!,
      newData: newData,
    );
    if (response.statusCode == 200) {
      await DialogService.showDialogSuccess(
        title: 'Berhasil',
        description: 'Profil rider berhasil diupdate',
      );
      Get.back();
    } else {
      DialogService.showDialogProblem(
        title: 'Error',
        description: response.message ?? 'Unknown error occurred.',
      );
    }
  }

  Future<void> updateSepedaProfile() async {
    SepedaDataUpdateModel newData = SepedaDataUpdateModel(
      id: sepedaData?.id,
      riderId: sepedaData?.riderId,
      frame: sepedaFrameController.text,
      asToAsRoda: sepedaAsToAsRodaController.text,
      helm: sepedaHelmController.text,
      panjangStem: sepedaPanjangStemController.text,
      panjangStang: sepedaPanjangStangController.text,
      diameterStang: sepedaDiameterStangController.text,
      tinggiSadel: sepedaTinggiSadelController.text,
      stemToStem: sepedaStemToStemController.text,
      fotoSepeda: sepedaImage,
    );
    ResponseModelAbstraction<UpdateRiderResponseModel> response =
        await _profileRiderRepository.updateSepeda(
      oldData: sepedaData!,
      newData: newData,
    );
    if (response.statusCode == 200) {
      await DialogService.showDialogSuccess(
        title: 'Berhasil',
        description: 'Data sepeda berhasil diupdate',
      );

      Get.back();
    } else {
      DialogService.showDialogProblem(
        title: 'Error',
        description: response.message ?? 'Unknown error occurred.',
      );
    }
  }

  Future<void> updateWaliProfile() async {
    WaliDataUpdateModel newData = WaliDataUpdateModel(
      id: waliData?.id,
      userId: waliData?.userId,
      namaMama: waliNamaMamaController.text,
      telpMama: waliTelpMamaController.text,
      namaPapa: waliNamaPapaController.text,
      emailAkun: waliEmailAkunController.text,
      alamat: waliAlamatController.text,
      fotoProfile: waliImage,
      fileKk: null,
      fileAkte: null,
      fileKia: null,
    );
    ResponseModelAbstraction<UpdateRiderResponseModel> response =
        await _profileRiderRepository.updateWali(
      oldData: waliData!,
      newData: newData,
    );
    if (response.statusCode == 200) {
      await DialogService.showDialogSuccess(
        title: 'Berhasil',
        description: 'Profil wali berhasil diupdate',
      );

      Get.back();
    } else {
      DialogService.showDialogProblem(
        title: 'Error',
        description: response.message ?? 'Unknown error occurred.',
      );
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    riderNamaLengkapController.dispose();
    riderPanggilanController.dispose();
    riderJulukanController.dispose();
    riderTanggalLahirController.dispose();
    riderDomisiliController.dispose();
    riderTinggiBadanController.dispose();
    riderPanjangKakiController.dispose();
    riderPanjangLenganController.dispose();
    riderLingkarKepalaController.dispose();
    riderUkuranSepatuController.dispose();
    riderNomorPlatController.dispose();
    riderWarnaOfficialController.dispose();

    sepedaFrameController.dispose();
    sepedaAsToAsRodaController.dispose();
    sepedaHelmController.dispose();
    sepedaPanjangStemController.dispose();
    sepedaPanjangStangController.dispose();
    sepedaDiameterStangController.dispose();
    sepedaTinggiSadelController.dispose();
    sepedaStemToStemController.dispose();

    waliNamaMamaController.dispose();
    waliTelpMamaController.dispose();
    waliNamaPapaController.dispose();
    waliEmailAkunController.dispose();
    waliAlamatController.dispose();
    super.onClose();
  }
}
