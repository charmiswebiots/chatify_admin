import '../../../config.dart';

class MobileSwitchCommon extends StatelessWidget {
  final String? title;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  const MobileSwitchCommon({Key? key,this.title,this.value,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!.tr,style: AppCss.nunitoSemiBold16.textColor(appCtrl.appTheme.blackColor)),
        Switch(
          activeColor: appCtrl.appTheme.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value!, onChanged: onChanged)
      ]
    ).paddingOnly(bottom: Insets.i10);
  }
}
