import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/modules/pembayaran/models/membership_model.dart';

class PembayaranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static PembayaranController get to => Get.find();
  TabController? tabController;

  LocalUserData? localUserData;

  final List<MembershipModel> memberships = [
    MembershipModel(
      title: 'Reguler Membership',
      price: 'IDR 100.000',
      description: 'Anda saat ini sedang terdaftar di reguler member',
      isCurrent: true,
      hasTerms: true,
      gradient: ColorConst.gradientGreen,
      icon: Icons.verified_user_rounded,
      terms: [
        'Memiliki sepeda pushbike dengan ukuran roda 12” tanpa pedal',
        'Memiliki helm standard pushbike',
        'Disarankan memiliki pelindung keamanan tambahan seperti pelindung lutut dan siku',
        'Melakukan registrasi awal kepada admin SCR Kids secara offline',
        'Mendapatkan ID dan Password dari admin SCR Kids',
        'Mengikuti latihan rutin SCR Kids',
        'Mematuhi segala peraturan yang telah ditetapkan oleh pihak official SCR Kids',
      ],
      errorText: "Maksimal batas pembayaran bulanan H+3",
    ),
    MembershipModel(
      title: 'Plus Membership',
      price: 'IDR 250.000',
      description: '',
      isCurrent: false,
      hasTerms: true,
      gradient: ColorConst.gradientYellow,
      icon: Icons.info_rounded,
      terms: [
        'Memiliki sepeda pushbike dengan ukuran roda 14” tanpa pedal',
        'Memiliki helm dan pelindung lengkap',
        'Melakukan registrasi secara online',
        'Mendapatkan fasilitas pelatihan tambahan',
      ],
      errorText: "Anda belum memenuhi syarat. Silahkan cek S&K",
    ),
    MembershipModel(
        title: 'Pro Membership',
        price: 'COMING SOON',
        description: '',
        isCurrent: false,
        hasTerms: false,
        gradient: const LinearGradient(
          colors: [ColorConst.textColour20, ColorConst.textColour20],
        ),
        icon: Icons.info_rounded,
        terms: [],
        isComingSoon: true),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    localUserData = LocalDbService.getUserLocalDataSync();
    super.onInit();
  }
}
