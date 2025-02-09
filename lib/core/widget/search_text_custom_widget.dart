import 'package:flutter/material.dart';

class SearchTextCustomWidget extends StatefulWidget {
  const SearchTextCustomWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onClear,
    this.onEditingComplete,
    this.onTap,
    this.onFieldSubmitted,
    this.readOnly,
    this.autofocus,
    this.enabled,
    this.showClearButton,
    this.showSearchIcon,
    this.textInputAction = TextInputAction.search,
  });

  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onClear;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Function()? onFieldSubmitted;
  final bool? readOnly;
  final bool? autofocus;
  final bool? enabled;
  final bool? showClearButton;
  final bool? showSearchIcon;
  final TextInputAction? textInputAction;

  @override
  State<SearchTextCustomWidget> createState() => _SearchTextCustomWidgetState();
}

class _SearchTextCustomWidgetState extends State<SearchTextCustomWidget> {
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      _isEmpty = widget.controller?.text.isEmpty ?? true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIcon: _isEmpty
            ? const Icon(
          Icons.search,
          color: Colors.grey,
        )
            : GestureDetector(
          onTap: () {
            widget.controller?.clear();
            widget.onClear?.call();
          },
          child: const Icon(Icons.clear),
        ),
      ),
      onFieldSubmitted: (value) {
        widget.onFieldSubmitted?.call();
      },
    );
  }
}
