import 'package:flutter/material.dart';

class ConfigTab {
  final Color? tabTopColor;
  final Color? selectedTabTextColor;
  final Color? unselectedTabTextColor;
  final bool showPoweredBy;

  ConfigTab(
      {this.tabTopColor,
      this.selectedTabTextColor,
      this.unselectedTabTextColor,
      this.showPoweredBy = true});
}
