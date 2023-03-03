import 'dart:developer';
import '../../../config.dart';

class LeadingRow extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const LeadingRow({Key? key,this.scaffoldKey,this.scaffoldDrawerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Row(children: [
        ValueListenableBuilder<bool>(
            valueListenable: indexCtrl.isOpen,
            builder: (context, value, child) {
              if (Responsive.isDesktop(context) && value) {
                return InkWell(
                    onTap: () {
                      log("message");
                    },
                    child: Container(
                        width: Sizes.s240,
                        padding: const EdgeInsets.symmetric(vertical: Insets.i15),
                        height: double.infinity,
                        color: appCtrl.appTheme.primary,
                        child: Image.asset( imageAssets.chatifyLogo2)));
              }
              return InkWell(
                  onTap: () {
                    log("message : ${indexCtrl.scaffoldDrawerKey}");
                    scaffoldDrawerKey!.currentState?.closeDrawer();
                  },
                  child: Responsive.isDesktop(context)
                      ? Container(
                          width: Sizes.s70,
                          padding: const EdgeInsets.all(Insets.i10),
                          color: appCtrl.appTheme.primary,
                          height: double.infinity,
                          child: Image.asset(imageAssets.Logo,
                              fit: BoxFit.contain))
                      : Container());
            }),
        MaterialButton(
            height: double.infinity,
            hoverColor: Colors.transparent,
            onPressed: () async {
              log("messageMaterial : $scaffoldDrawerKey");
              if (Responsive.isMobile(context) ||
                  Responsive.isTablet(context)) {
                if (scaffoldKey!.currentState!.isDrawerOpen) {
                  scaffoldKey!.currentState!.closeDrawer();
                } else {
                  scaffoldKey!.currentState!.openDrawer();
                }
              } else if (Responsive.isDesktop(context)) {

                scaffoldKey!.currentState!.closeDrawer();
                indexCtrl.isOpen.value = !indexCtrl.isOpen.value;
              }
            },
            child:  Icon(Icons.menu,color: appCtrl.appTheme.blackColor))
      ]);
    });
  }
}
