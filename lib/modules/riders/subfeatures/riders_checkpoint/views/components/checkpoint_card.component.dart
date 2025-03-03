import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';

enum StatusCard { done, onProgress, notYet }

class CheckpointCardComponent extends StatefulWidget {
  final DatumRiderCheckpoint data;

  final EdgeInsets margin;
  final Function()? onTap;

  const CheckpointCardComponent({
    required this.data,
    required this.margin,
    super.key,
    this.onTap,
  });

  @override
  State<CheckpointCardComponent> createState() =>
      _CheckpointCardComponentState();
}

class _CheckpointCardComponentState extends State<CheckpointCardComponent> {
  late String title;
  late String date;
  late String iconPath;
  StatusCard status = StatusCard.notYet;
  late Color color;

  void setData() {
    title = widget.data.judul ?? '';
    if (widget.data.tCheckpoint != null) {
      if (widget.data.tCheckpoint?.status == 'pending') {
        date = 'Proses Verifikasi Official';
        iconPath = AssetConst.icCheckpointPending;
        status = StatusCard.onProgress;
        color = ColorConst.textColour50;
      } else {
        date = widget.data.tCheckpoint!.createdAt
                ?.toDayMonthYearHourMinuteString() ??
            "-";
        iconPath = AssetConst.icCheckPembayaran;
        status = StatusCard.done;
        color = ColorConst.textColour90;
      }
    } else {
      date = 'View Detail';
      status = StatusCard.notYet;
      color = ColorConst.blue100;
    }
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        margin: widget.margin,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Conditional.single(
                context: context,
                conditionBuilder: (BuildContext context) =>
                    status != StatusCard.notYet,
                widgetBuilder: (BuildContext context) => Image.asset(
                  iconPath,
                  width: 42.w,
                  height: 42.w,
                ),
                fallbackBuilder: (BuildContext context) => Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: ColorConst.textColour20,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: ColorConst.textColour20,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.data.poin ?? '0'}',
                      style: AppTextStyles.title16Bold.copyWith(
                        color: ColorConst.textColour90,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.caption12Semibold.copyWith(
                        color: ColorConst.textColour90,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      date,
                      style: AppTextStyles.caption12Regular.copyWith(
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
