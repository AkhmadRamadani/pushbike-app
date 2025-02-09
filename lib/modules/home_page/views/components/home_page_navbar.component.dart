import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class HomePageNavbarComponents extends StatelessWidget {
  const HomePageNavbarComponents({
    super.key,
    required this.destination,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavigationBarItem> destination;
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextStyles.captionLimited10Semibold.copyWith(
          color: ColorConst.blue100,
        ),
        unselectedLabelStyle: AppTextStyles.captionLimited10Regular.copyWith(
          color: ColorConst.textColour40,
        ),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConst.blue90,
        items: destination,
        onTap: onTap,
      ),
    );
  }
}
