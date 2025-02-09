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
}
