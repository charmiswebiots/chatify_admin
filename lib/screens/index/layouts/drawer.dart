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
                      backgroundColor: appCtrl.appTheme.txt,
                      elevation: 2,
                      child: ListView(children: [
                        const VSpace(Sizes.s20),
                        Image.asset(appCtrl.isTheme ? imageAssets.chatifyLogo2 : imageAssets.chatifyLogo1, height: Sizes.s40)
                            .backgroundColor(appCtrl.appTheme.txt),
                        const VSpace(Sizes.s20),
                         DrawerList(value:value)
                      ])),
                );
              }));
    });
  }
}
