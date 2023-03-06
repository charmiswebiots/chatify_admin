import '../../../config.dart';

class ButtonLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? isNote;

  const ButtonLayout({Key? key, this.onTap, this.isNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (usageCtrl) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        (Responsive.isMobile(context) || Responsive.isTablet(context)) &&
                isNote == true
            ? SizedBox(
                    width: Sizes.s260,
                    child: Text(fonts.note.tr,
                        style: AppCss.poppinsSemiBold12
                            .textColor(appCtrl.appTheme.error)
                            .textHeight(1.2)))
                .paddingOnly(left: Insets.i15)
            : Container(),
        CommonButton(title: fonts.update, onTap: onTap, height: 60, width: 200,style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.whiteColor))
            .paddingOnly(bottom: Insets.i20, right: Insets.i20, top: Insets.i10)
      ]);
    });
  }
}
