library giphy_get;

// Imports
import 'package:flutter/material.dart';
import 'package:giphy_get/src/client/models/gif.dart';
import 'package:giphy_get/src/client/models/languages.dart';
import 'package:giphy_get/src/client/models/rating.dart';
import 'package:giphy_get/src/providers/app_bar_provider.dart';
import 'package:giphy_get/src/providers/sheet_provider.dart';
import 'package:giphy_get/src/views/config/config_main.dart';
import 'package:giphy_get/src/views/main_view.dart';
import 'package:giphy_get/src/providers/tab_provider.dart';
import 'package:provider/provider.dart';

// Giphy Client Export
export 'package:giphy_get/src/client/client.dart';
export 'package:giphy_get/src/client/models/collection.dart';
export 'package:giphy_get/src/client/models/gif.dart';
export 'package:giphy_get/src/client/models/image.dart';
export 'package:giphy_get/src/client/models/images.dart';
export 'package:giphy_get/src/client/models/languages.dart';
export 'package:giphy_get/src/client/models/rating.dart';
export 'package:giphy_get/src/client/models/user.dart';
export 'package:giphy_get/src/client/models/type.dart';
export 'package:giphy_get/src/widgets/giphy_gif.widget.dart';
export 'package:giphy_get/src/widgets/giphy_get.widget.dart';
export 'package:giphy_get/src/views/config/config_main.dart';
export 'package:giphy_get/src/views/appbar/config/config_searchbar.dart';
export 'package:giphy_get/src/views/tab/config/tab_config.dart';

class GiphyGet {
  // Show Bottom Sheet
  static Future<GiphyGif?> getGif(
      {required BuildContext context,
      required String apiKey,
      String rating = GiphyRating.g,
      String lang = GiphyLanguage.english,
      String randomID = "",
      String searchText = "",
      String queryText = "",
      bool modal = true,
      Color? tabColor,
      double radius = 10,
      ConfigMain? config}) {
    if (apiKey == "") {
      throw Exception("apiKey must be not null or not empty");
    }

    return showModalBottomSheet<GiphyGif>(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius))),
        isScrollControlled: true,
        context: context,
        builder: (ctx) => MultiProvider(providers: [
              ChangeNotifierProvider(
                create: (ctx) => AppBarProvider(queryText = queryText),
              ),
              ChangeNotifierProvider(
                create: (ctx) => SheetProvider(),
              ),
              ChangeNotifierProvider(
                  create: (ctx) => TabProvider(
                      apiKey: apiKey,
                      randomID: randomID,
                      tabColor:
                          tabColor ?? Theme.of(context).colorScheme.secondary,
                      searchText: searchText,
                      rating: rating,
                      lang: lang))
            ], child: SafeArea(child: MainView(config: config))));
  }
}
