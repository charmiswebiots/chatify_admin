import 'package:chatify_admin/config.dart';


class IndexController extends GetxController {

  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  String pageName = fonts.dashboard.tr;
  bool isHover = false;
  int isSelectedHover = 0;

  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    Dashboard(),
    UsageControlScreen(),
    Container(),
    Container()
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }

}