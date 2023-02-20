
import '../config.dart';
import 'config.dart';

class AppArray{
  //language list
  var languageList = [
    {'name': 'english', 'locale': const Locale('en', 'US')},
    {'name': 'arabic', 'locale': const Locale('ar', 'AE')},
    {'name': 'hindi', 'locale': const Locale('hi', 'IN')},
    {'name': 'korean', 'locale': const Locale('ko', 'KR')}
  ];

  //action list
  var actionList = [
    {'title': "english"},
    {'title': "hindi"},
    {'title': "korean"},
    {'title': "arabic"},
  ];

  //bottom list
  var drawerList = [
    {'icon': svgAssets.banner, 'title': "banners"},
    {'icon': svgAssets.page, 'title': "staticPage"},
    {'icon': svgAssets.bell, 'title': "notification"},
    {'icon': svgAssets.logout, 'title': "logout"},
  ];

}