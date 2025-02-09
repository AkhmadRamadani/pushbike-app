import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/level/models/responses/get_my_level.response.model.dart';
import 'package:pushbike_app/modules/level/repositories/level.repository.dart';

class LevelController extends GetxController {
  static LevelController get to => Get.find<LevelController>();

  final LevelRepository _levelRepository = LevelRepository();

  Rx<UIState<GetMyLevelResponseModel>> levelState =
      const UIState<GetMyLevelResponseModel>.idle().obs;

  @override
  void onInit() {
    super.onInit();
    getMyLevel();
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
