import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/helpers/local_db.helper.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/authentication/repositories/auth.repository.dart';
import 'package:pushbike_app/modules/dashboard/models/menu_model.dart';
import 'package:pushbike_app/modules/information/controllers/dashboard_information_section.controller.dart';
import 'package:pushbike_app/modules/level/models/responses/get_my_level.response.model.dart';
import 'package:pushbike_app/modules/level/repositories/level.repository.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find<DashboardController>();

  final AuthRepository _authRepository = AuthRepository();
  final LevelRepository _levelRepository = LevelRepository();
  final DashboardInformationSectionController _informationController =
      Get.put(DashboardInformationSectionController());
  Rx<UIState<LocalUserData>> userDataState =
      const UIState<LocalUserData>.idle().obs;
  Rx<UIState<GetMyLevelResponseModel>> levelState =
      const UIState<GetMyLevelResponseModel>.idle().obs;

  final List<MenuModel> listMenu = [
    MenuModel(
      assetPath: AssetConst.icJadwal,
      label: "Jadwal",
      onTap: () {
        Get.toNamed(AppRoutes.jadwal);
      },
    ),
    MenuModel(
      assetPath: AssetConst.icPembayaran,
      label: "Pembayaran",
      onTap: () {
        Get.toNamed(AppRoutes.pembayaran);
      },
    ),
    MenuModel(
      assetPath: AssetConst.icReport,
      label: "Report",
    ),
    MenuModel(
      assetPath: AssetConst.icModul,
      label: "Modul",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    getLocalData();
    getMyLevel();
  }

  Future<void> onRefresh() async {
    Future.wait([
      getUserData(),
      getMyLevel(),
      _informationController.getPengumumanData(),
    ]);
  }

  Future<void> getUserData() async {
    var userData = await LocalDbService.getUserLocalData();
    userDataState.value = const UIState.loading();
    try {
      final response = await _authRepository.getUserData();

      if (response.statusCode == 200 && response.data != null) {
        await LocalDBHelper.setUserLocalData(response, userData!.token ?? '');
        getLocalData();
      } else {
        userDataState.value =
            const UIState.error(message: 'User data not found');
        throw Exception(response.message ?? 'Failed to fetch user data.');
      }
    } catch (e, stackTrace) {
      DialogService.showDialogProblem(
        title: 'Failed to fetch user data',
        description: e.toString(),
      );
      userDataState.value = UIState.error(message: e.toString());
      debugPrint(
          'Error during fetching user data: $e\nStackTrace: $stackTrace');
    }
  }

  Future<void> getLocalData() async {
    userDataState.value = const UIState.loading();
    final response = await LocalDbService.getUserLocalData();
    if (response != null) {
      userDataState.value = UIState.success(data: response);
    } else {
      userDataState.value = const UIState.error(message: 'User data not found');
    }
    update();
  }

  Future<void> getMyLevel() async {
    levelState.value = const UIState.loading();

    try {
      final response = await _levelRepository.getMyLevel();
      if (response.data != null) {
        levelState.value = UIState.success(data: response.data!);
      } else {
        levelState.value = const UIState.error(message: 'Level data not found');
        throw Exception(response.message ?? 'Failed to fetch level data.');
      }
    } catch (e, stackTrace) {
      DialogService.showDialogProblem(
        title: 'Failed to fetch level data',
        description: e.toString(),
      );
      levelState.value = UIState.error(message: e.toString());
      debugPrint(
          'Error during fetching level data: $e\nStackTrace: $stackTrace');
    }
  }
}
