import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HubungiKamiView extends StatelessWidget {
  const HubungiKamiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Hubungi Kami'),
      body: Container(
        width: 1.sw,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Image.asset(
                AssetConst.drawQuestion,
                width: 300.w,
              ),
              SizedBox(height: 16.h),
              _buildIntroSection(),
              SizedBox(height: 16.h),
              _buildContactSection(
                title: "Team Official SCR Kids Kota Batu",
                contacts: [
                  const ContactTile(
                    name: 'Humas',
                    phone: '+62 813-3319-4296',
                    whatsappUrl: 'https://wa.me/6281333194296',
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildContactSection(
                title: "Team Aplikasi",
                contacts: [
                  const ContactTile(
                    name: 'Papa Ammar',
                    phone: '+62 813-3233-2166',
                    whatsappUrl: 'https://wa.me/6281332332166',
                  ),
                  const ContactTile(
                    name: 'Papa Abil',
                    phone: '+62 812-4083-2624',
                    whatsappUrl: 'https://wa.me/6281240832624',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kami senang mendengar dari Anda!',
          style:
              AppTextStyles.body14Regular.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.h),
        Text(
          'Jika Anda memiliki pertanyaan, masukan, ataupun membutuhkan bantuan, jangan ragu untuk menghubungi kami melalui salah satu nomor berikut:',
          style: AppTextStyles.body14Regular,
        ),
      ],
    );
  }

  Widget _buildContactSection({
    required String title,
    required List<ContactTile> contacts,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              AppTextStyles.body14Regular.copyWith(fontWeight: FontWeight.w600),
        ),
        ...contacts,
      ],
    );
  }
}

class ContactTile extends StatelessWidget {
  final String name;
  final String phone;
  final String whatsappUrl;

  const ContactTile({
    super.key,
    required this.name,
    required this.phone,
    required this.whatsappUrl,
  });

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      behavior: HitTestBehavior.translucent,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.blue100,
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.body14Regular,
            ),
            Row(
              children: [
                Image.asset(
                  AssetConst.icWhatsapp,
                  width: 12.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  phone,
                  style: AppTextStyles.caption12Regular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
