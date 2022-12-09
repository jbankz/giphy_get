import 'package:giphy_get/src/views/appbar/config/config_searchbar.dart';
import 'package:giphy_get/src/views/tab/config/tab_config.dart';

class ConfigMain {
  ConfigSearchBar? configSearchBar;
  ConfigTab? configTab;
  double radius;
  final Function()? callback;

  ConfigMain(
      {this.configSearchBar, this.configTab, this.radius = 10, this.callback});
}
