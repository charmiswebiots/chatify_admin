import '../../../config.dart';

class UserAppSettingsDesktop extends StatelessWidget {
  const UserAppSettingsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(builder: (userSettingCtrl) {
      return Column(children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            isDivider: true,
              title: fonts.isMaintenanceMode,
              value: userSettingCtrl.usageCtrl["isMaintenanceMode"],
              onChanged: (val) {
                userSettingCtrl.usageCtrl["isMaintenanceMode"] = val;
                userSettingCtrl.update();
              })
        ])
      ]).paddingAll(Insets.i30);
    });
  }
}
