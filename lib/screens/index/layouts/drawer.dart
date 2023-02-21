import '../../../common/config.dart';
import '../../../config.dart';
import 'drawer_list.dart';

class IndexDrawer extends StatelessWidget {
  const IndexDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Visibility(
          visible: MediaQuery.of(context).size.width <= 992,
          child: ValueListenableBuilder<bool>(
              valueListenable: indexCtrl.isOpen,
              builder: (context, value, child) {
                return MouseRegion(
                  onHover: (val) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  onExit: (exit) {
                    indexCtrl.isHover = false;
                    indexCtrl.update();
                  },
                  onEnter: (enter) {
                    indexCtrl.isHover = true;
                    indexCtrl.update();
                  },
                  child: Drawer(
                      backgroundColor: appCtrl.appTheme.primary,
                      elevation: 2,
                      child: ListView(children: [
                        Image.asset(imageAssets.chatifyLogo, height: Sizes.s80)
                            .backgroundColor(appCtrl.appTheme.primary),
                        const VSpace(Sizes.s20),
                         DrawerList(value:value)
                      ])),
                );
              }));
    });
  }
}
