import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class CustomInputTextWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final List<String? Function(String?)>? validators;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  const CustomInputTextWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.isPasswordField = false,
    this.textStyle,
    this.decoration,
    this.controller,
    this.validators,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  State<CustomInputTextWidget> createState() => _CustomInputTextWidgetState();
}

class _CustomInputTextWidgetState extends State<CustomInputTextWidget> {
  bool _isPasswordVisible = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _combinedValidator(String? value) {
    if (widget.validators != null) {
      for (final validator in widget.validators!) {
        final error = validator(value);
        if (error != null) {
          return error; // Return the first error encountered.
        }
      }
    }
    return null; // No errors found.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.textStyle ?? AppTextStyles.body14Regular,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          validator: _combinedValidator,
          obscureText: widget.isPasswordField && !_isPasswordVisible,
          style: widget.textStyle ?? AppTextStyles.body14Regular,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: widget.decoration?.copyWith(
                hintText: widget.hintText,
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                    : null,
              ) ??
              InputDecoration(
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConst.textColour30,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorConst.blue100,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Iconify(
                          _isPasswordVisible
                              ? Ph.eye_light
                              : Ph.eye_slash_light,
                          color: _focusNode.hasFocus
                              ? ColorConst.blue100
                              : ColorConst.textColour30,
                          size: 20,
                        ),
                      )
                    : null,
              ),
        ),
      ],
    );
  }
}
