import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/core/widget/general_empty_error_widget.dart';
import 'package:pushbike_app/modules/level/models/responses/rider_history_points.response.model.dart';
import 'package:pushbike_app/modules/point/controllers/point.controller.dart';
import 'package:pushbike_app/modules/point/views/components/point_card.component.dart';

class PointView extends StatelessWidget {
  const PointView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBarWidget(title: 'Riwayat Poin'),
      body: Obx(() => _buildBody()),
    );
  }

  Widget _buildBody() {
    final controller = PointController.to;

    return controller.listRiderHistoryPoints.value.whenOrNull(
          success: (data) => _buildPointList(controller),
          error: (error) => _buildEmptyState(error),
          loading: () => CustomShimmerWidget.buildShimmerWidget(
              width: 1.sw, height: 200.h),
          empty: (message) => _buildEmptyState(message),
        ) ??
        const SizedBox();
  }

  Widget _buildPointList(PointController controller) {
    return PagedListView<int, DatumRiderHistoryPoint>(
      pagingController: controller.pagingController,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      builderDelegate: PagedChildBuilderDelegate<DatumRiderHistoryPoint>(
        itemBuilder: (context, item, index) => PointCardComponent(item: item),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return SizedBox(
      width: double.infinity,
      height: 1.sh,
      child: Center(
        child: GeneralEmptyErrorWidget(
          customUrlImage: AssetConst.drawEmptyWidget,
          titleText: 'Riwayat Poin Kosong',
          descText: message,
          additionalWidgetBellowTextDesc: _buildRefreshButton(),
          onRefresh: () =>
              PointController.to.getRiderHistoryPoints(isRefresh: true),
        ),
      ),
    );
  }

  Widget _buildRefreshButton() {
    return InkWell(
      onTap: () => PointController.to.getRiderHistoryPoints(isRefresh: true),
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          "Refresh",
          style:
              AppTextStyles.body14Semibold.copyWith(color: ColorConst.blue100),
        ),
      ),
    );
  }
}
