import '../../../config.dart';

class UsageControlMobile extends StatelessWidget {
  const UsageControlMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (usageCtrl) {
      return Column(children: [
        MobileSwitchCommon(
            title: fonts.allowCreatingBroadcast,
            value: usageCtrl.usageCtrl["allow_creating_broadcast"],
            onChanged: (val) {
              usageCtrl.usageCtrl["allow_creating_broadcast"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
          title: fonts.allowCreatingGroup,
          value: usageCtrl.usageCtrl["allow_creating_group"],
          onChanged: (val) {
            usageCtrl.usageCtrl["allow_creating_group"] = val;
            usageCtrl.update();
          },
        ),
        MobileSwitchCommon(
            title: fonts.allowCreatingStatus,
            value: usageCtrl.usageCtrl["allow_creating_status"],
            onChanged: (val) {
              usageCtrl.usageCtrl["allow_creating_status"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
            title: fonts.callsAllowed,
            value: usageCtrl.usageCtrl["calls_allowed"],
            onChanged: (val) {
              usageCtrl.usageCtrl["calls_allowed"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
            title: fonts.existenceUser,
            value: usageCtrl.usageCtrl["existence_users"],
            onChanged: (val) {
              usageCtrl.usageCtrl["existence_users"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
            title: fonts.mediaSendAllowed,
            value: usageCtrl.usageCtrl["media_send_allowed"],
            onChanged: (val) {
              usageCtrl.usageCtrl["media_send_allowed"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
            title: fonts.showLogoutButton,
            value: usageCtrl.usageCtrl["show_logout_button"],
            onChanged: (val) {
              usageCtrl.usageCtrl["show_logout_button"] = val;
              usageCtrl.update();
            }),
        MobileSwitchCommon(
            title: fonts.textMessageAllowed,
            value: usageCtrl.usageCtrl["text_messag_allowed"],
            onChanged: (val) {
              usageCtrl.usageCtrl["text_messag_allowed"] = val;
              usageCtrl.update();
            }),
        MobileTextFieldCommon(
            validator: (number) => Validation().broadCastValidation(number),
            title: fonts.broadcastMemberLimit,
            controller: usageCtrl.broadCastMemberLimit),
        MobileTextFieldCommon(
            validator: (number) => Validation().groupValidation(number),
            title: fonts.groupMemberLimit,
            controller: usageCtrl.groupMemberLimit),
        MobileTextFieldCommon(
            validator: (number) => Validation().maxContactValidation(number),
            title: fonts.maxContactSelectForward,
            controller: usageCtrl.maxContactSelectForward),
        MobileTextFieldCommon(
            validator: (number) => Validation().maxFileValidation(number),
            title: fonts.maxFileSize,
            controller: usageCtrl.maxFileSize),
        MobileTextFieldCommon(
            validator: (number) => Validation().maxFileMultiValidation(number),
            title: fonts.maxFileMultiShare,
            controller: usageCtrl.maxFileMultiShare),
        MobileTextFieldCommon(
            // isNote: true,
            validator: (number) => Validation().statusValidation(number),
            title: fonts.statusDeleteTime,
            controller: usageCtrl.statusDeleteTime)
      ]).paddingAll(Insets.i15);
    });
  }
}
