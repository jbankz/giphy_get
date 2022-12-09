import 'package:flutter/cupertino.dart';

class ConfigSearchBar {
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool showSuffix;
  final bool showPrefix;
  final Color? fillColor;
  final Color? cursorColor;
  final double? borderRadius;

  ConfigSearchBar(
      {this.hint,
      this.prefix,
      this.suffix,
      this.showSuffix = true,
      this.showPrefix = true,
      this.fillColor,
      this.cursorColor,
      this.borderRadius});
}
