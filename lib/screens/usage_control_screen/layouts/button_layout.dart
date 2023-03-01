import '../../../config.dart';
import '../../../widgets/button_common.dart';

class ButtonLayout extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isNote;
  const ButtonLayout({Key? key,this.onPressed,this.isNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(
      builder: (usageCtrl) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context)) && isNote == true
              ? SizedBox(
                      width: 260,
                      child: Text(fonts.note.tr,
                          style: AppCss.nunitoSemiBold12
                              .textColor(appCtrl.appTheme.error)
                              .textHeight(1.2)))
                  .paddingOnly(left: Insets.i15)
              : Container(),
          UpdateButton(title: fonts.update,onPressed: onPressed)
              .paddingOnly(bottom: Insets.i20, right: Insets.i20, top: Insets.i10)
        ]);
      }
    );
  }
}
