import 'package:flutter/material.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';

class RaceRecapView extends StatelessWidget {
  const RaceRecapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBarWidget(
        title: 'Race History',
      ),
    );
  }
}
