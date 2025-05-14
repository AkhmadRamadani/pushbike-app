import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class GeneralAppBarSearchWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? leadingIcon;
  final void Function(String)? onSearch;

  const GeneralAppBarSearchWidget({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.backgroundColor,
    this.titleColor,
    this.leadingIcon,
    this.onSearch,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<GeneralAppBarSearchWidget> createState() =>
      _GeneralAppBarSearchWidgetState();
}

class _GeneralAppBarSearchWidgetState extends State<GeneralAppBarSearchWidget> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        widget.onSearch?.call('');
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24.r),
        bottomRight: Radius.circular(24.r),
      ),
      child: AppBar(
        backgroundColor: widget.backgroundColor ?? ColorConst.blue100,
        leading: widget.leadingIcon ??
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorConst.textColour00,
              ),
              onPressed: widget.onLeadingPressed ?? () => Get.back(),
            ),
        centerTitle: true,
        title: _isSearching
            ? TextFormField(
                controller: _searchController,
                autofocus: true,
                style: AppTextStyles.h418Bold.copyWith(
                  color: widget.titleColor ?? ColorConst.textColour00,
                ),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: AppTextStyles.h418Bold.copyWith(
                    color: (widget.titleColor ?? ColorConst.textColour00)
                        .withAlpha(100),
                  ),
                  border: InputBorder.none,
                ),
                onFieldSubmitted: widget.onSearch,
              )
            : Text(
                widget.title,
                style: AppTextStyles.h418Bold.copyWith(
                  color: widget.titleColor ?? ColorConst.textColour00,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: ColorConst.textColour00,
            ),
            onPressed: _toggleSearch,
          ),
        ],
      ),
    );
  }
}
