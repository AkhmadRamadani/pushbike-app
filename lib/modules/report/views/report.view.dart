import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBarWidget(title: "Report"),
      body: Center(
          child: GeneralEmptyErrorWidget(
        isCentered: true,
        titleText: "Under Construction",
        descText:
            "This feature is still under construction, please check back later.",
        customUrlImage: AssetConst.drawMaintenance,
      )),
    );
  }
}
