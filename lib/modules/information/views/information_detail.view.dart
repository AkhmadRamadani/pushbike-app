import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/widget/custom_shimmer_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/modules/information/controllers/information_detail.controller.dart';

class InformationDetailView extends StatelessWidget {
  const InformationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InformationDetailController());
    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Informasi',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () =>
                    controller.pengumumanData.value.whenOrNull(
                      success: (data) => Text(
                        data.judul ?? "",
                        style: AppTextStyles.h418Semibold,
                      ),
                      error: (error) => Text(
                        error,
                        style: AppTextStyles.h418Semibold,
                      ),
                      loading: () => CustomShimmerWidget.buildShimmerWidget(
                        width: 200.w,
                        height: 24.h,
                      ),
                    ) ??
                    const SizedBox(),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Iconify(
                    Mdi.calendar_month_outline,
                    size: 14.sp,
                    color: ColorConst.textColour50,
                  ),
                  SizedBox(width: 10.w),

                  ///Date
                  Obx(
                    () =>
                        controller.pengumumanData.value.whenOrNull(
                          success: (data) => Text(
                            '${data.createdAt?.toHumanReadableDateString()} | ',
                            style:
                                AppTextStyles.captionLimited10Regular.copyWith(
                              color: ColorConst.textColour50,
                            ),
                          ),
                          error: (error) => Text(
                            error,
                            style:
                                AppTextStyles.captionLimited10Regular.copyWith(
                              color: ColorConst.textColour50,
                            ),
                          ),
                          loading: () => CustomShimmerWidget.buildShimmerWidget(
                            width: 100.w,
                            height: 10.h,
                          ),
                        ) ??
                        const SizedBox(),
                  ),

                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Iconify(
                          Mdi.account_circle,
                          size: 14.sp,
                          color: ColorConst.textColour50,
                        )),
                  ),
                  SizedBox(width: 2.w),
                  Flexible(
                    child: Obx(
                      () =>
                          controller.pengumumanData.value.whenOrNull(
                            success: (data) => Text(
                              data.createdBy?.name ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
                                color: ColorConst.textColour50,
                              ),
                            ),
                            error: (error) => Text(
                              error,
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
                                color: ColorConst.textColour50,
                              ),
                            ),
                            loading: () =>
                                CustomShimmerWidget.buildShimmerWidget(
                              width: 100.w,
                              height: 10.h,
                            ),
                          ) ??
                          const SizedBox(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 1.sw,
                child: Obx(
                  () =>
                      controller.pengumumanData.value.whenOrNull(
                        success: (data) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            data.foto ?? "",
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 200.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorConst.textColour50,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        error: (error) => Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorConst.textColour50,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                            ),
                          ),
                        ),
                        loading: () => CustomShimmerWidget.buildShimmerWidget(
                          width: 1.sw,
                          height: 1.sw,
                        ),
                      ) ??
                      Container(
                        width: 200.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConst.textColour50,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                          ),
                        ),
                      ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () =>
                    controller.pengumumanData.value.whenOrNull(
                      success: (data) => Html(
                        data: data.deskripsi ?? "",
                      ),
                      error: (error) => Text(
                        error,
                        style: AppTextStyles.h418Semibold,
                      ),
                      loading: () => CustomShimmerWidget.buildShimmerWidget(
                        width: 200.w,
                        height: 24.h,
                      ),
                    ) ??
                    const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
