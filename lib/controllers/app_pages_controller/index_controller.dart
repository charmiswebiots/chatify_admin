import 'package:chatify_admin/config.dart';
import 'package:chatify_admin/screens/report/report.dart';
import 'package:chatify_admin/screens/wallpaper/wallpaper.dart';

import '../../screens/language_screen/language_screen.dart';

class IndexController extends GetxController {

  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  String pageName = fonts.dashboard;
  bool isHover = false;
  int isSelectedHover = 0;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[

    Dashboard(),
    UsageControlScreen(),
    UserAppSettingsScreen(),
    AdminStatusScreen(),
    WallPaper(),
    Report(),LanguageScreen(),

    Container()
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }

}