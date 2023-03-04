import 'dart:developer';
import '../../../config.dart';
import 'dart:html' as html;

class DrawerList extends StatelessWidget {
  final bool? value;

  const DrawerList({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Column(children: [
        ...appArray.drawerList.asMap().entries.map((e) {
          return MouseRegion(
              onHover: (val) {
                indexCtrl.isHover = true;
                indexCtrl.isSelectedHover = e.key;
                indexCtrl.update();
              },
              onExit: (exit) {
                indexCtrl.isHover = false;
                indexCtrl.update();
                log("val : ${indexCtrl.isHover}");
              },
              child: ListTile(
                  minVerticalPadding: 0,
                  dense: true,
                  leading: SvgPicture.asset(e.value["icon"]!,
                      height: Sizes.s22, color: appCtrl.appTheme.white),
                  title: Responsive.isDesktop(context) && value == false
                      ? Container()
                      : Text(e.value["title"].toString().tr,
                          style: AppCss.poppinsMedium14
                              .textColor(appCtrl.appTheme.white)),
                  onTap: () {
                    indexCtrl.selectedIndex = e.key;
                    indexCtrl.pageName = e.value["title"]!;
                    if (!Responsive.isDesktop(context)) {
                      Get.back();
                    }
                    if (indexCtrl.selectedIndex == 4) {
                      FirebaseAuth.instance.signOut();
                      indexCtrl.selectedIndex = 0;
                      html.window.localStorage[session.isLogin] = "false";
                      appCtrl.isLogged = false;
                      appCtrl.storage.remove("isSignIn");
                      appCtrl.storage.remove(session.isDarkMode);
                      appCtrl.storage.remove(session.languageCode);
                      log("index: ${indexCtrl.selectedIndex}");
                      Get.offAll(() => LoginScreen());
                    }
                    indexCtrl.update();
                  }).decorated(
                  color: indexCtrl.isHover && indexCtrl.isSelectedHover == e.key
                      ? appCtrl.appTheme.primaryLight
                      : appCtrl.appTheme.primary,
                  border: Border(
                      left: BorderSide(
                          color: indexCtrl.selectedIndex == e.key
                              ? appCtrl.appTheme.primaryLight
                              : indexCtrl.isHover &&
                                      indexCtrl.isSelectedHover == e.key
                                  ? appCtrl.appTheme.txt
                                  : appCtrl.appTheme.primary))));
        }).toList()
      ]);
    });
  }
}
