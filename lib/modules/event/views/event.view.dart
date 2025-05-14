import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/custom_tabbar_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_search_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/event/controllers/event.controller.dart';
import 'package:pushbike_app/modules/event/controllers/show_more_event.controller.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';
import 'package:pushbike_app/modules/event/repositories/event.repository.dart';
import 'package:pushbike_app/modules/event/views/components/other_event_card.component.dart';
import 'package:pushbike_app/modules/event/views/components/this_month_event_card.component.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Scaffold(
      appBar: GeneralAppBarSearchWidget(
        title: 'Event',
        leadingIcon: const SizedBox.shrink(),
        onSearch: (p0) {
          if (p0.isNotEmpty) {
            Get.toNamed(
              AppRoutes.moreEvent,
              arguments: {
                'eventType': EventCategory.all,
                'keyword': p0,
                'eventDateCategory': EventDateCategory.others,
              },
            );
          }
        },
      ),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // External events tab.
                _buildEventTabContent(
                  title: "Event Bulan Ini 🔥",
                  monthlyPagingController:
                      controller.pagingControllerExternalMonthly,
                  othersPagingController:
                      controller.pagingControllerExternalOthers,
                  eventCategory: EventCategory.external,
                ),
                // Internal events tab.
                _buildEventTabContent(
                  title: "Event Bulan Ini 🔥",
                  monthlyPagingController:
                      controller.pagingControllerInternalMonthly,
                  othersPagingController:
                      controller.pagingControllerInternalOthers,
                  eventCategory: EventCategory.internal,
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
    required PagingController<int, DatumEvent> monthlyPagingController,
    required PagingController<int, DatumEvent> othersPagingController,
    required EventCategory eventCategory,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        EventController.to.getEventExternalOthersData(isRefresh: true);
        EventController.to.getEventInternalOthersData(isRefresh: true);
        EventController.to.getEventThisMonthExternalData(isRefresh: true);
        EventController.to.getEventThisMonthInternalData(isRefresh: true);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.title16Semibold.copyWith(
                      color: ColorConst.textColour90,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.moreEvent,
                        arguments: {
                          'eventType': eventCategory,
                          'eventDateCategory': EventDateCategory.monthly,
                        },
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: AppTextStyles.body14Regular.copyWith(
                        color: ColorConst.blue100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Horizontal list for "This Month" events.
            SizedBox(
              width: double.infinity,
              height: 0.33.sh,
              child: PagedListView<int, DatumEvent>(
                scrollDirection: Axis.horizontal,
                pagingController: monthlyPagingController,
                builderDelegate: PagedChildBuilderDelegate<DatumEvent>(
                  itemBuilder: (context, item, index) => Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20.w : 0,
                      right: 10.w,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await Get.toNamed(
                          AppRoutes.detailEvent,
                          arguments: {
                            'eventId': item.id,
                          },
                        );

                        EventController.to
                            .getEventThisMonthExternalData(isRefresh: true);
                        EventController.to
                            .getEventThisMonthInternalData(isRefresh: true);
                      },
                      child: ThisMonthEventCardComponent(
                        // Pass the fetched event to the card.
                        event: item,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Separator(
              thickness: 8.h,
              color: ColorConst.textColour10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
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
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.moreEvent,
                        arguments: {
                          'eventType': eventCategory,
                          'eventDateCategory': EventDateCategory.others,
                        },
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: AppTextStyles.body14Regular.copyWith(
                        color: ColorConst.blue100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Vertical list for "Other" events.
            PagedListView<int, DatumEvent>(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              pagingController: othersPagingController,
              builderDelegate: PagedChildBuilderDelegate<DatumEvent>(
                itemBuilder: (context, item, index) => GestureDetector(
                  onTap: () async {
                    await Get.toNamed(
                      AppRoutes.detailEvent,
                      arguments: {
                        'eventId': item.id,
                      },
                    );

                    EventController.to
                        .getEventExternalOthersData(isRefresh: true);
                    EventController.to
                        .getEventInternalOthersData(isRefresh: true);
                  },
                  child: OtherEventCardComponent(
                    event: item,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
