import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';

class TentangKamiView extends StatefulWidget {
  const TentangKamiView({super.key});

  @override
  State<TentangKamiView> createState() => _TentangKamiViewState();
}

class _TentangKamiViewState extends State<TentangKamiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Tentang Aplikasi'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Selamat datang di POP!\nPushbike Online Platform, salah satu Inovasi terbaru dari kami yang bertujuan untuk mengatur semua kegiatan perpushbikean lebih semakin mudah dan tersampaikan secara merata ke semua anggota baru maupun lama.",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              "Aplikasi ini dirancang untuk memberikan kemudahan, kecepatan, dan kenyamanan kepada pengguna. Dengan fitur-fitur inovatif yang terus kami kembangkan, kami berkomitmen untuk mendukung Anda mencapai lebih banyak hal setiap hari.",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              "Aplikasi POP! adalah hasil dari semangat, kreativitas, dan dedikasi tim kami untuk menghadirkan teknologi yang ramah pengguna. Kami berharap aplikasi ini bisa menjadi bagian penting dalam melakukan kegiatan didunia perpushbikean ini.",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              "Terima kasih telah mensupport Kami dan mari Kita berkembang bersama!",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Developed By : Papa Ammar & Papa Abil",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Version Apps : 1.0",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Copyright © 2024 SCR Kids Pushbike Community",
              style: AppTextStyles.body14Regular.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
