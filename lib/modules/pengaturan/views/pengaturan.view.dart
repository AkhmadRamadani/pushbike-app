import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/pengaturan/controllers/pengaturan.controller.dart';

class PengaturanView extends StatelessWidget {
  const PengaturanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Pengaturan'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 1.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.ubahPassword);
                },
                behavior: HitTestBehavior.translucent,
                child: _listTile(
                  title: 'Ubah Password',
                  leading: const Icon(
                    Icons.lock_outline,
                    color: ColorConst.blue100,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.tentangKami);
                },
                behavior: HitTestBehavior.translucent,
                child: _listTile(
                  title: 'Tentang Aplikasi',
                  leading: const Icon(
                    Icons.apps_rounded,
                    color: ColorConst.blue100,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.hubungiKami);
                },
                behavior: HitTestBehavior.translucent,
                child: _listTile(
                    title: 'Hubungi Kami',
                    leading: const Icon(
                      Icons.support_agent_rounded,
                      color: ColorConst.blue100,
                      size: 24,
                    )),
              ),
              SizedBox(height: 16.h),
            GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.perolehanPoint);
                },
                behavior: HitTestBehavior.translucent,
                child: _listTile(
                  title: 'Perolehan Poin',
                  leading: const Icon(
                    Icons.star_rounded,
                    color: ColorConst.blue100,
                    size: 24,
                  ),
                ),
              ),
              const Spacer(),
              GetBuilder<PengaturanController>(
                  init: PengaturanController(),
                  builder: (ctr) {
                    return ElevatedButton(
                      onPressed: ctr.dialog,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: ColorConst.blue100,
                        disabledBackgroundColor: ColorConst.textColour40,
                      ),
                      child: Text(
                        'Log out',
                        style: AppTextStyles.h418Semibold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _listTile({
    required Widget leading,
    required String title,
  }) {
    return ListTile(
      title: Text(
        title,
        style:
            AppTextStyles.body14Regular.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: ColorConst.blue100,
      ),
      leading: leading,
      dense: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: ColorConst.textColour20,
          width: 1,
        ),
      ),
    );
  }
}
