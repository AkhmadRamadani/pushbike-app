import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/modules/dashboard/views/dashboard.view.dart';
import 'package:pushbike_app/modules/event/views/event.view.dart';
import 'package:pushbike_app/modules/home_page/controllers/home_page.controller.dart';
import 'package:pushbike_app/modules/home_page/views/components/home_page_navbar.component.dart';
import 'package:pushbike_app/modules/riders/views/rider.view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomePageController>();
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: Obx(
          () => HomePageNavbarComponents(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.onItemTapped(index);
            },
            destination: controller.destinations,
          ),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.onItemTapped(index);
        },
        children: [
          const DashboardView(),
          const RiderView(),
          const EventView(),
          //  add logout button
          Container(
            color: Colors.white,
            child: Center(
              child: InkWell(
                onTap: () {
                  controller.logout();
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
