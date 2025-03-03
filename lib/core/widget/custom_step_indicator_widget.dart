import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

class CustomStepIndicatorLevelWidget extends StatefulWidget {
  final List<Level> list;
  final double page; // Change to double
  final Widget? positiveCheck;
  final double height;
  final Duration? durationScroller;
  final Duration? durationCheckBulb;
  final EdgeInsetsGeometry? padding;
  final Function(int)? onClickItem;
  final EdgeInsetsGeometry? paddingLine;
  final int? division;
  final Color? positiveColor;
  final Color? negativeColor;
  final Color? progressColor;
  final Function(double) onChange; // Change to double
  final double? leftMargin;

  const CustomStepIndicatorLevelWidget({
    super.key,
    required this.onChange,
    required this.list,
    this.durationScroller,
    this.durationCheckBulb,
    this.division,
    this.onClickItem,
    this.paddingLine,
    this.padding,
    this.positiveCheck,
    this.negativeColor,
    this.positiveColor,
    this.progressColor,
    required this.page, // Change to double
    required this.height,
    this.leftMargin,
  });

  @override
  State<CustomStepIndicatorLevelWidget> createState() =>
      _CustomStepIndicatorLevelWidgetState();
}

class _CustomStepIndicatorLevelWidgetState
    extends State<CustomStepIndicatorLevelWidget> {
  ScrollController controller = ScrollController();
  double maxWidths = 0.0;

  EdgeInsetsGeometry get paddingBulb =>
      (widget.padding != null) ? widget.padding! : EdgeInsets.zero;

  EdgeInsetsGeometry get paddingLine =>
      (widget.paddingLine != null) ? widget.paddingLine! : EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: widget.height + 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            shrinkWrap: true,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) => (index == 0)
                ? ItemStepIndicatorZero(
                    onClickItem: widget.onClickItem,
                    duration: _currentDurationBulb(),
                    childCheck: _checkEnable(),
                    padding: paddingBulb,
                    disableColor: (widget.negativeColor == null)
                        ? Colors.grey
                        : widget.negativeColor!,
                    enableColor: (widget.positiveColor == null)
                        ? Colors.green
                        : widget.positiveColor!,
                    progressColor: (widget.progressColor == null)
                        ? Colors.orange
                        : widget.progressColor!,
                    index: index,
                    currentPage: widget.page, // Change to double
                    height: widget.height,
                    width: widget.height,
                    data: widget.list[index],
                    leftMargin: widget.leftMargin ?? 0,
                  )
                : ItemStepIndicator(
                    onClickItem: widget.onClickItem,
                    duration: _currentDurationBulb(),
                    childCheck: _checkEnable(),
                    height: widget.height,
                    paddingLine: paddingLine,
                    padding: paddingBulb,
                    currentPage: widget.page, // Change to double
                    disableColor: (widget.negativeColor == null)
                        ? Colors.grey
                        : widget.negativeColor!,
                    enableColor: (widget.positiveColor == null)
                        ? Colors.green
                        : widget.positiveColor!,
                    progressColor: (widget.progressColor == null)
                        ? Colors.orange
                        : widget.progressColor!,
                    index: index,
                    width: widthIndicator(constraints.maxWidth),
                    data: widget.list[index],
                  ),
          );
        },
      ),
    );
  }

  Duration _currentDuration() {
    return (widget.durationScroller == null)
        ? const Duration(milliseconds: 250)
        : widget.durationScroller!;
  }

  Duration _currentDurationBulb() {
    return (widget.durationCheckBulb == null)
        ? const Duration(milliseconds: 250)
        : widget.durationCheckBulb!;
  }

  Widget _checkEnable() {
    return (widget.positiveCheck == null)
        ? const Icon(
            Icons.check_rounded,
            size: 15,
            color: Colors.white,
          )
        : widget.positiveCheck!;
  }

  @override
  void didUpdateWidget(covariant CustomStepIndicatorLevelWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (((widget.list.length * widget.height) > (maxWidths / 2))) {
      if ((widget.page - 2) >= 0 &&
          (widget.page - 2) <= (widget.list.length - 5)) {
        controller.animateTo((widget.page - 2) * widthIndicator(maxWidths),
            duration: _currentDuration(), curve: Curves.decelerate);
      }
    } else {
      // ignore: curly_braces_in_flow_control_structures
      if (((((maxWidths - widget.height) / (widget.list.length - 1)) <
          // ignore: curly_braces_in_flow_control_structures
          (widget.height + 5)))) if ((widget.page - 2) >=
              0 &&
          (widget.page - 2) <= (widget.list.length - 5)) {
        controller.animateTo((widget.page - 2) * widthIndicator(maxWidths),
            duration: _currentDuration(), curve: Curves.decelerate);
      }
    }
    widget.onChange.call(widget.page);
  }

  double widthIndicator(double maxWidth) {
    maxWidths = maxWidth;
    return (((widget.list.length * widget.height) > (maxWidth / 2)))
        ? widthScroller(maxWidth)
        : ((((maxWidth - widget.height) / (widget.list.length - 1)) >
                (widget.height + 5)))
            ? ((maxWidth - widget.height) / (widget.list.length - 1))
            : widthScroller(maxWidth);
  }

  double widthScroller(double maxWidth) {
    return ((maxWidth - widget.height) /
        (((widget.list.length - 1) <= 2)
            ? (widget.list.length - 1)
            : (widget.division == null ||
                    (widget.division! <= 0) ||
                    (widget.division! >= widget.list.length))
                ? 4
                : widget.division!));
  }
}

class ItemStepIndicatorZero extends StatelessWidget {
  final double width;
  final double height;
  final double currentPage; // Change to double
  final EdgeInsetsGeometry padding;
  final Duration duration;
  final int index;
  final Function(int)? onClickItem;
  final Color disableColor;
  final Color progressColor;
  final Color enableColor;
  final Widget childCheck;
  final Level? data;
  final double leftMargin;

  const ItemStepIndicatorZero({
    super.key,
    required this.height,
    required this.duration,
    required this.padding,
    this.onClickItem,
    required this.width,
    required this.currentPage, // Change to double
    required this.index,
    required this.disableColor,
    required this.progressColor,
    required this.enableColor,
    required this.childCheck,
    this.data,
    required this.leftMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: (onClickItem == null)
                  ? null
                  : () {
                      onClickItem!.call(index);
                    },
              child: Container(
                height: height,
                width: width,
                padding: padding,
                child: AnimatedContainer(
                  curve: Curves.easeOutQuint,
                  duration: duration,
                  decoration: BoxDecoration(
                    color: (index == currentPage.floor())
                        ? Colors.transparent
                        : (index < currentPage ? enableColor : disableColor),
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(
                        color: (index == currentPage.floor())
                            ? progressColor
                            : (index < currentPage
                                ? enableColor
                                : disableColor),
                        width: (index == currentPage.floor()) ? 2 : 0),
                  ),
                  padding:
                      EdgeInsets.all((index == currentPage.floor()) ? 2.5 : 0),
                  alignment: Alignment.centerRight,
                  child: Center(
                      child: (index == currentPage.floor())
                          ? AnimatedContainer(
                              duration: Duration(
                                  milliseconds: duration.inMilliseconds ~/ 1.3),
                              width: double.maxFinite,
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: (index == currentPage.floor())
                                      ? progressColor
                                      : (index < currentPage
                                          ? enableColor
                                          : disableColor),
                                  borderRadius: BorderRadius.circular(150)),
                            )
                          : ShowUpAnimationPage(
                              duration: duration, delay: 0, child: childCheck)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Text(
                  data?.nama ?? '',
                  style: AppTextStyles.caption12Semibold,
                ),
                Text(
                  '${data?.minimalPoin ?? 0} Poin',
                  style: AppTextStyles.caption12Regular,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemStepIndicator extends StatelessWidget {
  final double width;
  final double height;
  final double currentPage; // Change to double
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry paddingLine;
  final Function(int)? onClickItem;
  final Duration duration;
  final int index;
  final Color disableColor;
  final Color progressColor;
  final Color enableColor;
  final Widget childCheck;
  final Level? data;

  const ItemStepIndicator({
    super.key,
    required this.height,
    required this.duration,
    required this.width,
    required this.currentPage, // Change to double
    required this.paddingLine,
    this.onClickItem,
    required this.padding,
    required this.index,
    required this.disableColor,
    required this.progressColor,
    required this.enableColor,
    required this.childCheck,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          InkWell(
              splashColor: Colors.transparent,
              onTap: (onClickItem == null)
                  ? null
                  : () {
                      onClickItem!.call(index);
                    },
              child: Column(
                children: [
                  Container(
                    padding: padding,
                    height: height,
                    width: height,
                    child: SizedBox(
                        child: (index == currentPage.floor())
                            ? _enable()
                            : (index < currentPage)
                                ? _done()
                                : _disable()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Text(
                          data?.nama ?? '',
                          style: AppTextStyles.caption12Semibold,
                        ),
                        Text(
                          '${data?.minimalPoin ?? 0} Poin',
                          style: AppTextStyles.caption12Regular,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              child: Container(
            padding: paddingLine,
            height: height / (height / 4.4),
            child: TweenAnimationBuilder<double>(
                tween: Tween(
                    begin: 0,
                    end: (index == currentPage.floor())
                        ? currentPage - index
                        : (index < currentPage ? 1.0 : 0.0)),
                curve: Curves.decelerate,
                duration:
                    Duration(milliseconds: duration.inMilliseconds ~/ 1.6),
                builder: (context, value, _) => LayoutBuilder(
                      builder: (context, constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Stack(
                              children: [
                                Visibility(
                                    visible: (index >= currentPage.floor()),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                      color:
                                          disableColor.withValues(alpha: 0.5),
                                    )),
                                AnimatedContainer(
                                  duration: Duration(
                                      milliseconds:
                                          duration.inMilliseconds ~/ 1.6),
                                  width: (constraints.maxWidth * value),
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    gradient: (index == currentPage.floor())
                                        ? LinearGradient(
                                            colors: [enableColor, enableColor],
                                            end: Alignment.centerRight,
                                            begin: Alignment.centerLeft)
                                        : (index < currentPage
                                            ? LinearGradient(
                                                colors: [
                                                    enableColor,
                                                    enableColor
                                                  ],
                                                end: Alignment.centerRight,
                                                begin: Alignment.centerLeft)
                                            : LinearGradient(
                                                colors: [
                                                    enableColor.withValues(
                                                        alpha: 0.5),
                                                    disableColor.withValues(
                                                        alpha: 0.5)
                                                  ],
                                                end: Alignment.centerRight,
                                                begin: Alignment.centerLeft)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
          ))
        ],
      ),
    );
  }

  Widget _done() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: enableColor,
        borderRadius: BorderRadius.circular(150),
      ),
      alignment: Alignment.centerRight,
      child: Center(
          child: ShowUpAnimationPage(
              duration: duration, delay: 0, child: childCheck)),
    );
  }

  Widget _disable() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: Colors.transparent, width: 0.0),
      ),
      padding: const EdgeInsets.all(2.6),
      alignment: Alignment.centerRight,
      child: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: duration.inMilliseconds ~/ 1),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: disableColor.withValues(alpha: .5),
            borderRadius: BorderRadius.circular(150)),
      )),
    );
  }

  Widget _enable() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: progressColor, width: 2.0),
      ),
      padding: const EdgeInsets.all(2.5),
      alignment: Alignment.centerRight,
      child: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: duration.inMilliseconds ~/ 1),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: progressColor, borderRadius: BorderRadius.circular(150)),
      )),
    );
  }
}

class ShowUpAnimationPage extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final int delay;

  const ShowUpAnimationPage(
      {super.key,
      required this.duration,
      required this.child,
      required this.delay});

  @override
  createState() => _ShowUpAnimationPage();
}

class _ShowUpAnimationPage extends State<ShowUpAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: widget.duration);
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, -0.05), end: Offset.zero)
            .animate(curve);
// ignore: unnecessary_null_comparison
    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
