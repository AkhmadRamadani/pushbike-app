import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_tabbar_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/event/controllers/event.controller.dart';
import 'package:pushbike_app/modules/event/views/components/other_event_card.component.dart';
import 'package:pushbike_app/modules/event/views/components/this_month_event_card.component.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Scaffold(
      appBar: GeneralAppBarWidget(
        title: 'Event',
        leadingIcon: const SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildEventTabContent(
                  title: "Event Bulan Ini 🔥",
                  itemCount: 5,
                  cardBuilder: (index) => const ThisMonthEventCardComponent(
                    imageUrl: 'https://picsum.photos/200/300',
                    status: 'Terdaftar',
                    title: 'Jalan Jalan',
                    date: '20 Januari 2023',
                    location: 'Jakarta',
                    price: 'Rp 100.000',
                    label: 'Kolektif',
                  ),
                  otherEventsBuilder: (index) => const OtherEventCardComponent(
                    imageUrl: 'https://picsum.photos/200/300',
                    status: 'Terdaftar',
                    title: 'Jalan Jalan',
                    location: 'Jakarta',
                    date: '20 Januari 2023',
                    price: 'Rp 100.000',
                    label: 'Mandiri',
                  ),
                ),
                _buildEventTabContent(
                  title: "Event Bulan Ini 🔥",
                  itemCount: 5,
                  cardBuilder: (index) => const ThisMonthEventCardComponent(
                    imageUrl: 'https://picsum.photos/200/300',
                    status: 'Terdaftar',
                    title: 'Jalan Jalan',
                    date: '20 Januari 2023',
                    location: 'Jakarta',
                    price: 'Rp 100.000',
                    label: 'Kolektif',
                  ),
                  otherEventsBuilder: (index) => const OtherEventCardComponent(
                    imageUrl: 'https://picsum.photos/200/300',
                    status: 'Terdaftar',
                    title: 'Jalan Jalan',
                    location: 'Jakarta',
                    date: '20 Januari 2023',
                    price: 'Rp 100.000',
                    label: 'Mandiri',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(EventController controller) {
    return CustomTabbarWidget(
      tabController: controller.tabController!,
      tabs: const [
        Tab(text: 'External'),
        Tab(text: 'Internal'),
      ],
    );
  }

  Widget _buildEventTabContent({
    required String title,
    required int itemCount,
    required Widget Function(int index) cardBuilder,
    required Widget Function(int index) otherEventsBuilder,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 12.h,
            ),
            child: Text(
              title,
              style: AppTextStyles.title16Semibold.copyWith(
                color: ColorConst.textColour90,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 0.3.sh,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20.w : 0,
                    right: 10.w,
                  ),
                  child: cardBuilder(index),
                );
              },
            ),
          ),
          SizedBox(height: 36.h),
          Separator(
            thickness: 8.h,
            color: ColorConst.textColour10,
          ),
          Column(
            children: [
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Event Lainnya',
                      style: AppTextStyles.title16Semibold.copyWith(
                        color: ColorConst.textColour90,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => otherEventsBuilder(index),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
