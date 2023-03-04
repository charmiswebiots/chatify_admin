import '../config.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  const UpdateButton({Key? key,this.onPressed,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: appCtrl.appTheme.primary),
        child: Text(title!.tr,
            style:
            AppCss.poppinsMedium16.textColor(appCtrl.appTheme.white)));
  }
}
