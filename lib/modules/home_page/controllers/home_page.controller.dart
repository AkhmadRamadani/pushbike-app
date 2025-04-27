import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';

class HomePageController extends GetxController {
  PageController pageController = PageController();
  Rx<int> selectedIndex = 0.obs;

  List<BottomNavigationBarItem> destinations = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetConst.icHomeNavbarInactive),
      activeIcon: SvgPicture.asset(AssetConst.icHomeNavbarActive),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetConst.icRidersNavbarInactive),
      activeIcon: SvgPicture.asset(AssetConst.icRidersNavbarActive),
      label: 'Riders',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetConst.icEventNavbarInactive),
      activeIcon: SvgPicture.asset(AssetConst.icEventNavbarActive),
      label: 'Event',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetConst.icSettingNavbarInactive),
      activeIcon: SvgPicture.asset(AssetConst.icSettingNavbarActive),
      label: 'Setting',
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
