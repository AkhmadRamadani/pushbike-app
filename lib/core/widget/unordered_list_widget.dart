import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class UnorderedListWidget extends StatelessWidget {
  final List<String> items;
  final TextStyle? textStyle;
  final Widget? separator;

  const UnorderedListWidget({
    super.key,
    required this.items,
    this.textStyle,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "• ",
              style: textStyle ??
                  AppTextStyles.body14Regular.copyWith(
                    color: ColorConst.textColour90,
                  ),
            ),
            Expanded(
              child: Text(
                items[index],
                style: textStyle ??
                    AppTextStyles.body14Regular.copyWith(
                      color: ColorConst.textColour90,
                    ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => separator ?? const SizedBox(height: 8),
      itemCount: items.length,
    );
  }
}
