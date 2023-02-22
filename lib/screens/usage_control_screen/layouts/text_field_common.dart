import '../../../config.dart';

class MobileTextFieldCommon extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  const MobileTextFieldCommon({Key? key,this.title,this.controller,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!.tr,style: AppCss.nunitoSemiBold16.textColor(appCtrl.appTheme.blackColor1)),
        const HSpace(Sizes.s10),
        SizedBox(
            width: 80,
            child: TextFormField(
              validator: validator,
              cursorColor: appCtrl.appTheme.primary,
              controller: controller!,
              decoration:  InputDecoration(
                  isDense: true,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appCtrl.appTheme.primary,width: 2)),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appCtrl.appTheme.primary)),
                contentPadding: const EdgeInsets.symmetric(vertical: Insets.i10,horizontal: Insets.i10),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appCtrl.appTheme.primary)),
                border: OutlineInputBorder(borderSide: BorderSide(color: appCtrl.appTheme.primary))
              ),
            )).paddingOnly(right: Insets.i10)
      ]
    ).paddingOnly(bottom: Insets.i20);
  }
}
