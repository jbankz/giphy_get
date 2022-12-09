import 'package:flutter/material.dart';

import 'config/tab_config.dart';

class GiphyTabTop extends StatefulWidget {
  GiphyTabTop({this.configTab, Key? key}) : super(key: key);

  final ConfigTab? configTab;

  @override
  State<GiphyTabTop> createState() => _GiphyTabTopState();
}

class _GiphyTabTopState extends State<GiphyTabTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: 50,
      height: 2,
      color: widget.configTab?.tabTopColor ??
          Theme.of(context).textTheme.bodyText1!.color!,
    );
  }
}
