import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/helpers/background_color_helper.dart';
import 'package:pushbike_app/modules/authentication/features/on_board/controllers/on_board.controller.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardController>(
      init: OnBoardController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: 1.sh,
            decoration: BoxDecoration(
                color: BackgroundColorHelper.hexToColor(
                    controller.localUserData.komunitas?.warnaBg ?? "#FFFFFF")),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    controller.localUserData.komunitas?.logo ?? "",
                    width: 200,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Welcome Rider",
                      style: AppTextStyles.h418Regular.copyWith(
                        color: BackgroundColorHelper.isColorDark(
                          BackgroundColorHelper.hexToColor(
                              controller.localUserData.komunitas?.warnaBg ??
                                  "#FFFFFF"),
                        )
                            ? Colors.white
                            : Colors.black,
                      )),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    controller.localUserData.komunitas?.namaKomunitas ?? "",
                    style: AppTextStyles.h320Bold.copyWith(
                        color: BackgroundColorHelper.isColorDark(
                      BackgroundColorHelper.hexToColor(
                          controller.localUserData.komunitas?.warnaBg ??
                              "#FFFFFF"),
                    )
                            ? Colors.white
                            : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
