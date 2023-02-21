
import '../config.dart';

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
    {'icon': svgAssets.dashboard, 'title': "dashboard"},
    {'icon': svgAssets.usageControl, 'title': "usageControl"},
    {'icon': svgAssets.appControl, 'title': "appSetting"},
    {'icon': svgAssets.logout, 'title': "logout"},
  ];

}