import '../../config.dart';

class UserAppSettingsScreen extends StatelessWidget {
  final userSettingCtrl = Get.put(UserAppSettingsController());

  UserAppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(builder: (userSettingCtrl) {
      if (userSettingCtrl.usageCtrl != null) {
        return Stack(alignment: Alignment.center, children: [
              Form(
                  key: userSettingCtrl.formKey,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            SizedBox(
                                child: Column(children: [
                              Responsive.isMobile(context) || Responsive.isTablet(context)
                                  ? const UserAppSettingsMobile()
                                  : const UserAppSettingsDesktop(),

                            ])).boxExtension(),
                            if(Responsive.isDesktop(context))
                            const HSpace(Sizes.s20),
                             if(Responsive.isDesktop(context))
                            SizedBox(
                                child:  Column(
                                  children: [
                                    MediaQuery.of(context).size.width < 1700 ?
                                    Column(
                                      children: [
                                        DesktopTextFieldCommon(
                                            width:MediaQuery.of(context).size.width < 1500 ? Sizes.s200 : Sizes.s300,
                                            validator: (number) => Validation().statusValidation(number),
                                            title: fonts.approvalMessage,
                                            controller: userSettingCtrl.approvalMessage),
                                        const VSpace(Sizes.s30),
                                        DesktopTextFieldCommon(
                                            width: MediaQuery.of(context).size.width < 1500 ? Sizes.s200 : Sizes.s300,
                                            validator: (number) => Validation().statusValidation(number),
                                            title: fonts.maintenanceMessage,
                                            controller: userSettingCtrl.maintenanceMessage)
                                      ]
                                    ).paddingAll(Insets.i30) :
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      DesktopTextFieldCommon(
                                          width: Sizes.s390,
                                          validator: (number) => Validation().statusValidation(number),
                                          title: fonts.approvalMessage,
                                          controller: userSettingCtrl.approvalMessage),
                                      const HSpace(Sizes.s30),
                                      DesktopTextFieldCommon(
                                          width: Sizes.s390,
                                          validator: (number) => Validation().statusValidation(number),
                                          title: fonts.maintenanceMessage,
                                          controller: userSettingCtrl.maintenanceMessage),
                                    ]).paddingAll(Insets.i30)
                                  ]
                                ),
                            ).boxExtension()
                          ]
                        )
                      ),
                      ButtonLayout(onTap: () => userSettingCtrl.updateData())
                    ]
                  )),
              if (userSettingCtrl.isLoading)
                Center(
                    child: CircularProgressIndicator(
                        color: appCtrl.appTheme.primary))
            ]);
      } else {
        return Center(
              child:
                  CircularProgressIndicator(color: appCtrl.appTheme.primary));
      }
    });
  }
}
