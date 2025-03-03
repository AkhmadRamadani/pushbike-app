import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/rider_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/sepeda_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/wali_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/repositories/profile_rider.repository.dart';

class ProfileRiderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  final ProfileRiderRepository _profileRiderRepository =
      ProfileRiderRepository();

  RiderDataUpdateModel? riderData;
  SepedaDataUpdateModel? sepedaData;
  WaliDataUpdateModel? waliData;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getInitialData();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  Future<void> getInitialData() async {
    try {
      DialogService.showLoading(
        barrierDismissible: true,
      );

      final res = await _profileRiderRepository.getInitialData();

      DialogService.closeLoading();

      if (res.statusCode == 200) {
        riderData = res.data?.data?.rider;

        waliData = res.data?.data?.wali;

        if (res.data?.data?.sepeda != null) {
          if (res.data?.data?.sepeda?.isNotEmpty ?? false) {
            sepedaData = res.data?.data?.sepeda?.first;
          }
        }
      }

      update();
    } catch (e) {
      DialogService.closeLoading();
      DialogService.showDialogProblem(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
