import 'package:get/get.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/information/models/responses/get_pengumuman_data.response.model.dart';
import 'package:pushbike_app/modules/information/repositories/information.repository.dart';

class InformationDetailController extends GetxController {
  static InformationDetailController get to =>
      Get.find<InformationDetailController>();

  final InformationRepository _informationRepository = InformationRepository();
  final Rx<UIState<DatumPengumumanModel>> pengumumanData =
      const UIState<DatumPengumumanModel>.idle().obs;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    if (args != null) {
      if (args is DatumPengumumanModel) {
        getPengumumanData(args.id!);
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }
  }

  Future<void> getPengumumanData(int id) async {
    pengumumanData.value = const UIState<DatumPengumumanModel>.loading();
    try {
      final response = await _informationRepository.postReadAnnouncement(id);
      if (response.statusCode == 200) {
        pengumumanData.value =
            UIState.success(data: response.data!.data!.pengumuman!);
      } else {
        pengumumanData.value = UIState.error(
          message: response.message ?? 'Data not found',
        );
      }
    } catch (e) {
      pengumumanData.value = UIState<DatumPengumumanModel>.error(
        message: e.toString(),
      );
    }
  }
}
