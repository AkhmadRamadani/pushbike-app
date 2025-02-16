import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';

class PaymentDataModel {
  final String month;
  final String amount;
  final String? lateText; // Optional for late payments
  final String? dateTime; // Optional for payment history

  PaymentDataModel({
    required this.month,
    required this.amount,
    this.lateText,
    this.dateTime,
  });

  // from PaymetHistoryDatum
  factory PaymentDataModel.fromPaymetHistoryDatum(PaymentHistoryDatum datum) {
    return PaymentDataModel(
      month: datum.createdAt?.toReadableMonth() ?? '',
      amount: datum.nominalNum.toRupiah(),
      dateTime: datum.createdAt?.toDayMonthYearHourMinuteString(),
    );
  }
}
