import 'package:get/get.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/payment_data_model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_latest_bill.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/repositories/pembayaran.repository.dart';

class DetailPembayaranController extends GetxController {
  static DetailPembayaranController get to => Get.find();

  PembayaranRepository pembayaranRepository = PembayaranRepository();

  LocalUserData? localUserData;

  Rx<UIState<List<PaymentDataModel>>> paymentHistoryState =
      const UIState<List<PaymentDataModel>>.idle().obs;
  Rx<UIState<LatestBillData>> latestBillState =
      const UIState<LatestBillData>.idle().obs;

  late DateTime selectedDate;

  @override
  void onInit() {
    super.onInit();
    selectedDate = DateTime.now();
    localUserData = LocalDbService.getUserLocalDataSync();
    getPaymentHistory();
    getLatestBill();
  }

  Future<void> getPaymentHistory() async {
    paymentHistoryState.value = const UIState.loading();
    try {
      final response = await pembayaranRepository.getPaymentHistory();
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        List<PaymentDataModel> payments = [];
        for (var i = 0; i < response.data!.data!.length; i++) {
          var item = response.data!.data![i];
          payments.add(PaymentDataModel.fromPaymetHistoryDatum(
            item,
          ));
        }

        paymentHistoryState.value = UIState.success(data: payments);
      } else {
        paymentHistoryState.value = UIState.error(
          message: response.message ?? 'Failed to fetch payment history.',
        );
      }
    } catch (e) {
      paymentHistoryState.value = UIState.error(message: e.toString());
    }
  }

  Future<void> getLatestBill() async {
    latestBillState.value = const UIState.loading();
    try {
      final response = await pembayaranRepository.getLatestBill(
        date: selectedDate,
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        latestBillState.value = UIState.success(data: response.data!.data!);
      } else {
        latestBillState.value = UIState.error(
          message: response.message ?? 'Failed to fetch latest bill.',
        );
      }
    } catch (e) {
      latestBillState.value = UIState.error(message: e.toString());
    }
  }

  // set is this month is late or not
  String? setIsThisMonthLate({
    PaymentHistoryDatum? pembayaran,
    MembershipData? membership,
  }) {
    if (pembayaran == null || membership == null) {
      var current = selectedDate;
      var deadline = DateTime(
        current.year,
        current.month,
        5,
      );

      if (current.isAfter(deadline)) {
        return 'Terlambat ${current.difference(deadline).inDays} Hari';
      } else {
        return 'Belum Dibayar';
      }
    }

    return null;
  }
}
