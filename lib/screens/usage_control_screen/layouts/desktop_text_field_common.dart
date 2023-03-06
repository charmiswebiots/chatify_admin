import '../../../config.dart';

class DesktopTextFieldCommon extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? isNote,isAppSettings;
  final double? width;

  const DesktopTextFieldCommon(
      {Key? key, this.title, this.controller, this.validator,this.isNote,this.isAppSettings,this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width/*isAppSettings == true ? 420 : MediaQuery.of(context).size.width < 1500 ? 300 : MediaQuery.of(context).size.width > 1500 ? 420 : 180*/,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title!.tr,
              style: AppCss.poppinsMedium18
                  .textColor(appCtrl.appTheme.dark)),
          if(isNote == true)
          Text(fonts.note.tr,
              style: AppCss.poppinsSemiBold12
                  .textColor(appCtrl.appTheme.error).textHeight(1.2)),
          const VSpace(Sizes.s15),
          TextFormField(
            style: AppCss.poppinsMedium14.textColor(appCtrl.appTheme.gray),
              validator: validator,
              cursorColor: appCtrl.appTheme.primary,
              controller: controller!,
              decoration: InputDecoration(
                    errorStyle: AppCss.poppinsMedium10,
                  isDense: true,
                  filled: true,
                  fillColor: appCtrl.appTheme.gray.withOpacity(0.1),
                border: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(AppRadius.r8)),
                    borderSide:
                    BorderSide(width: 0, style: BorderStyle.none)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: Insets.i15, horizontal: Insets.i10),
                 ))

        ]));
  }
}
