import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/pembayaran/models/membership_model.dart';
import 'package:pushbike_app/modules/pembayaran/repositories/pembayaran.repository.dart';

class PembayaranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static PembayaranController get to => Get.find();
  TabController? tabController;

  LocalUserData? localUserData;

  PembayaranRepository repository = PembayaranRepository();

  Rx<UIState<List<MembershipModel>>> membershipState =
      const UIState<List<MembershipModel>>.idle().obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    localUserData = LocalDbService.getUserLocalDataSync();
    getMembershipList();
    super.onInit();
  }

  Future<void> getMembershipList() async {
    membershipState.value = const UIState.loading();
    try {
      final response = await repository.getMembershipList();
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        List<MembershipModel> memberships = [];
        for (var i = 0; i < response.data!.data!.length; i++) {
          memberships
              .add(MembershipModel.fromDataMembership(response.data!.data![i]));
        }

        membershipState.value = UIState.success(data: memberships);
      } else {
        membershipState.value = UIState.error(
          message: response.message ?? 'Failed to fetch membership list.',
        );
      }
    } catch (e) {
      membershipState.value = UIState.error(message: e.toString());
    }
  }
}
