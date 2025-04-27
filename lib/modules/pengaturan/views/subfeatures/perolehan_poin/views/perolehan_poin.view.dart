import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';

class PerolehanPoinView extends StatelessWidget {
  const PerolehanPoinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Perolehan Poin'),
      body: Container(
        width: 1.sw,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Image.asset(
                AssetConst.drawPoinIlustrasi,
                width: 300.w,
              ),
              SizedBox(height: 16.h),
              Text(
                "Hello, Rider!",
                style: AppTextStyles.h418Bold,
              ),
              SizedBox(height: 8.h),
              Text(
                "Di sini, setiap aktivitasmu bisa menjadi lebih menyenangkan dengan poin reward yang bisa kamu kumpulkan supaya rankmu semakin tinggi. Berikut adalah beberapa cara untuk mendapatkan poin:",
                style: AppTextStyles.body14Regular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              const ExampleExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleExpansionTile extends StatefulWidget {
  const ExampleExpansionTile({super.key});

  @override
  State<ExampleExpansionTile> createState() => _ExampleExpansionTileState();
}

class _ExampleExpansionTileState extends State<ExampleExpansionTile> {
  // Track the expansion states for each tile
  bool _isAbsensiExpanded = false;
  bool _isModulExpanded = false;
  bool _isRidersExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildExpansionTile(
            title: "Absensi Latihan",
            isExpanded: _isAbsensiExpanded,
            onExpansionChanged: (val) {
              setState(() => _isAbsensiExpanded = val);
            },
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lakukan absensi pada menu jadwal latihan dengan cara:",
                  style: AppTextStyles.caption12Regular,
                ),
                const SizedBox(height: 8),
                Text(
                  "1. Masuk ke menu 'Jadwal Latihan'",
                  style: AppTextStyles.caption12Regular,
                ),
                Text(
                  "2. Klik 'Hadir' sesuai dengan hari yang aktif",
                  style: AppTextStyles.caption12Regular,
                ),
                Text(
                  "3. Upload bukti kehadiran",
                  style: AppTextStyles.caption12Regular,
                ),
                Text(
                  "4. Tunggu hingga tim admin meng-approve absensi",
                  style: AppTextStyles.caption12Regular,
                ),
                const SizedBox(height: 8),
                Text(
                  "Jika pengajuannya sudah disetujui oleh admin, poin kamu "
                  "otomatis akan bertambah ya",
                  style: AppTextStyles.caption12Regular,
                ),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
        _buildExpansionTile(
          title: "Melihat Modul Latihan",
          isExpanded: _isModulExpanded,
          onExpansionChanged: (val) {
            setState(() => _isModulExpanded = val);
          },
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lakukan pembelajaran pada menu modul latihan dengan cara:",
                style: AppTextStyles.caption12Regular,
              ),
              const SizedBox(height: 8),
              Text(
                "1. Masuk ke menu 'Modul Latihan'",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "2. Tonton Video",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "3. Upload bukti kehadiran",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "4. Tunggu hingga tim admin meng-approve absensi",
                style: AppTextStyles.caption12Regular,
              ),
              const SizedBox(height: 8),
              Text(
                "Jika pengajuannya sudah disetujui oleh admin, poin kamu "
                "otomatis akan bertambah ya",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        _buildExpansionTile(
          title: "Riders Checkpoint",
          isExpanded: _isRidersExpanded,
          onExpansionChanged: (val) {
            setState(() => _isRidersExpanded = val);
          },
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lakukan absensi pada menu Checkpoint dengan cara:",
                style: AppTextStyles.caption12Regular,
              ),
              const SizedBox(height: 8),
              Text(
                "1. Masuk ke menu 'Riders' -> Riders Checkpoint",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "2. Klik 'Hadir' sesuai dengan hari yang aktif",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "3. Upload bukti kehadiran",
                style: AppTextStyles.caption12Regular,
              ),
              Text(
                "4. Tunggu hingga tim admin meng-approve absensi",
                style: AppTextStyles.caption12Regular,
              ),
              const SizedBox(height: 8),
              Text(
                "Jika pengajuannya sudah disetujui oleh admin, poin kamu "
                "otomatis akan bertambah ya",
                style: AppTextStyles.caption12Regular,
              ),
            ],
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required bool isExpanded,
    required ValueChanged<bool> onExpansionChanged,
    required Widget content,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst.blue10,
        border: Border.all(color: ColorConst.blue50),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          // This triggers whenever the tile is expanded/collapsed
          onExpansionChanged: onExpansionChanged,
          // Title of the tile
          title: Text(
            title,
            style: AppTextStyles.body14Semibold.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          // Change the trailing icon based on expansion state
          trailing: isExpanded
              ? const Icon(Icons.remove, color: Colors.black)
              : const Icon(Icons.add, color: Colors.black),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
