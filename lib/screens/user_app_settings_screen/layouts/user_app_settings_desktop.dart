import '../../../config.dart';

class UserAppSettingsDesktop extends StatelessWidget {
  const UserAppSettingsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(builder: (userSettingCtrl) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          DesktopSwitchCommon(
              title: fonts.allowUserBlock,
              value: userSettingCtrl.usageCtrl["allow_user_block"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["allow_user_block"] = val;
                userSettingCtrl.update();
              }),
          DesktopSwitchCommon(
              title: fonts.approvalNeeded,
              value: userSettingCtrl.usageCtrl["approval_needed"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["approval_needed"] = val;
                userSettingCtrl.update();
              }),
          DesktopSwitchCommon(
              title: fonts.isMaintenanceMode,
              value: userSettingCtrl.usageCtrl["isMaintenanceMode"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["isMaintenanceMode"] = val;
                userSettingCtrl.update();
              })
        ]).paddingOnly(bottom: Insets.i20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          DesktopTextFieldCommon(
              width: MediaQuery.of(context).size.width < 1500 ? Sizes.s350 : Sizes.s420,
              validator: (number) => Validation().statusValidation(number),
              title: fonts.approvalMessage,
              controller: userSettingCtrl.approvalMessage),
          DesktopTextFieldCommon(
              width: Sizes.s220,
              validator: (number) => Validation().statusValidation(number),
              title: fonts.maintenanceMessage,
              controller: userSettingCtrl.maintenanceMessage),
          SizedBox(width:MediaQuery.of(context).size.width > 1500 ? Sizes.s380 : Sizes.s10)
        ]).paddingOnly(bottom: Insets.i20)
      ]).paddingAll(Insets.i15);
    });
  }
}
