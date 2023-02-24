import '../../../config.dart';

class UserAppSettingsMobile extends StatelessWidget {
  const UserAppSettingsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(
      builder: (userSettingCtrl) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          MobileSwitchCommon(
              title: fonts.allowUserBlock,
              value:
              userSettingCtrl.usageCtrl["allow_user_block"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["allow_user_block"] =
                    val;
                userSettingCtrl.update();
              }),
          MobileSwitchCommon(
              title: fonts.approvalNeeded,
              value: userSettingCtrl.usageCtrl["approval_needed"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["approval_needed"] =
                    val;
                userSettingCtrl.update();
              }),
          MobileSwitchCommon(
              title: fonts.isMaintenanceMode,
              value:
              userSettingCtrl.usageCtrl["isMaintenanceMode"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["isMaintenanceMode"] = val;
                userSettingCtrl.update();
              }),
          DesktopTextFieldCommon(
            width: 420,
              isAppSettings: true,
              validator: (number) =>
                  Validation().statusValidation(number),
              title: fonts.approvalMessage,
              controller: userSettingCtrl.approvalMessage),
          DesktopTextFieldCommon(
              width: 420,
              isAppSettings: true,
              validator: (number) =>
                  Validation().statusValidation(number),
              title: fonts.maintenanceMessage,
              controller: userSettingCtrl.maintenanceMessage)
        ]).paddingAll(Insets.i15);
      }
    );
  }
}
