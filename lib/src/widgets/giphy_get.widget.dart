import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giphy_get/src/views/appbar/config/config_searchbar.dart';
import 'package:giphy_get/src/views/config/config_main.dart';

import '../../giphy_get.dart';

//Builder
typedef GiphyGetWrapperBuilder = Widget Function(
    Stream<GiphyGif>, GiphyGetWrapper);

class GiphyGetWrapper extends StatelessWidget {
  final String giphy_api_key;
  final GiphyGetWrapperBuilder builder;
  final StreamController<GiphyGif> streamController =
      new StreamController.broadcast();

  GiphyGetWrapper(
      {Key? key, required this.giphy_api_key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(streamController.stream, this);
  }

  getGif(String queryText, BuildContext context,
      {ConfigMain? configMain}) async {
    GiphyGif? gif = await GiphyGet.getGif(
        queryText: queryText,
        context: context,
        apiKey: giphy_api_key, //YOUR API KEY HERE
        lang: GiphyLanguage.spanish,
        radius: configMain?.radius ?? 10,
        config: configMain);
    if (gif != null) {
      streamController.add(gif);
      if (configMain?.callback != null) configMain?.callback!();
    }

    // stream.add(gif!);
  }
}
