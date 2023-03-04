import '../../../config.dart';

class DesktopSwitchCommon extends StatelessWidget {
  final String? title;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  const DesktopSwitchCommon({Key? key, this.value, this.title, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Sizes.s180,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title!.tr,
                  style: AppCss.poppinsSemiBold16
                      .textColor(appCtrl.appTheme.blackColor)),
              const VSpace(Sizes.s10),
              Switch(
                  activeColor: appCtrl.appTheme.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: value!,
                  onChanged: onChanged)
            ]));
  }
}
