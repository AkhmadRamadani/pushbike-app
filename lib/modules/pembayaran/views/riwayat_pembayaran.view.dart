import 'package:flutter/material.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/pembayaran/models/payment_data_model.dart';
import 'package:pushbike_app/modules/pembayaran/views/components/payment_card.dart';

class RiwayatPembayaranView extends StatelessWidget {
  const RiwayatPembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentDataModel> paymentDataList = [
      PaymentDataModel(
        month: "Bulan November",
        amount: "Rp. 500.000",
        lateText: "Telat 10 Hari",
      ),
      PaymentDataModel(
        month: "Bulan September",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
      PaymentDataModel(
        month: "Bulan Oktober",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
      PaymentDataModel(
        month: "Bulan November",
        amount: "Rp. 500.000",
        dateTime: "01 Okt 2024, 15:10",
      ),
    ];
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Riwayat Pembayaran',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: paymentDataList.length,
          itemBuilder: (context, index) {
            final payment = paymentDataList[index];
            return PaymentCard(
              month: payment.month,
              amount: payment.amount,
              lateText: payment.lateText,
              dateTime: payment.dateTime,
            );
          },
        ),
      ),
    );
  }
}
