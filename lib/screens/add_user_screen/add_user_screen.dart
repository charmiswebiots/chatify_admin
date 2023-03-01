import 'dart:developer';

import 'package:chatify_admin/controllers/app_pages_controller/add_user_controller.dart';

import '../../config.dart';

class AddUserScreen extends StatelessWidget {
  final addUserCtrl = Get.put(AddUserController());
   AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUserController>(
      builder: (_) {
        return SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100, width: 100, child: Image.asset(imageAssets.addUser)),
                const VSpace(Sizes.s50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Form(
                      key: addUserCtrl.formKey,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(fonts.name.tr,
                            style: AppCss.nunitoBold16
                                .textColor(appCtrl.appTheme.blackColor)),
                        const VSpace(Sizes.s10),
                        CommonTextBox(
                          controller: addUserCtrl.nameCtrl,
                            validator: (val) =>
                                LoginValidator().checkNameValidation(val),
                            hinText: fonts.enterName.tr),
                        const VSpace(Sizes.s30),
                        Text(fonts.phoneNumber.tr,
                            style: AppCss.nunitoBold16
                                .textColor(appCtrl.appTheme.blackColor)),
                        const VSpace(Sizes.s10),
                        CommonTextBox(
                            controller: addUserCtrl.numberCtrl,
                            validator: (val) =>
                                LoginValidator().checkNumberValidation(val),
                            hinText: fonts.enterNumber.tr),
                        const VSpace(Sizes.s30),
                        Text(fonts.email.tr,
                            style: AppCss.nunitoBold16
                                .textColor(appCtrl.appTheme.blackColor)),
                        const VSpace(Sizes.s10),
                        CommonTextBox(
                            controller: addUserCtrl.emailCtrl,
                            hinText: fonts.enterEmail.tr)
                      ])
                    ),
                    UpdateButton(title: fonts.addUser, onPressed: () {
                      if(addUserCtrl.formKey.currentState!.validate()) {

                      }
                    })
                        .paddingOnly(top: Insets.i20)
                  ]
                )
              ]),
        ).paddingAll(Insets.i15).boxExtension();
      }
    );
  }
}
