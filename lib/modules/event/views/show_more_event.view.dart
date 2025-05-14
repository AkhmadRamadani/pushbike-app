import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/widget/general_app_bar_search_widget.dart';
import 'package:pushbike_app/modules/event/controllers/show_more_event.controller.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';
import 'package:pushbike_app/modules/event/views/components/other_event_card.component.dart';

class ShowMoreEventView extends StatelessWidget {
  const ShowMoreEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowMoreEventController>(
      init: ShowMoreEventController(),
      builder: (controller) {
        return Scaffold(
          appBar: GeneralAppBarSearchWidget(
            title: controller.appBarTitle,
            onSearch: (p0) {
              // if (p0.isNotEmpty) {
              controller.keyword = p0;
              controller.pagingController.refresh();
              controller.update();
              // }
            },
          ),
          body: PagedListView<int, DatumEvent>(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<DatumEvent>(
              itemBuilder: (context, item, index) => GestureDetector(
                onTap: () async {
                  await Get.toNamed(
                    AppRoutes.detailEvent,
                    arguments: {
                      'eventId': item.id,
                    },
                  );
                  controller.pagingController.refresh();
                },
                child: OtherEventCardComponent(
                  event: item,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
