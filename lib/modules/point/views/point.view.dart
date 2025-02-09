import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';

class PointView extends StatelessWidget {
  const PointView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBarWidget(
        title: 'Riwayat Poin',
      ),
      body: const Center(
        child: GeneralEmptyErrorWidget(),
      ),
    );
  }
}
