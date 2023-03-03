import '../../../config.dart';

class UsageControlDesktop extends StatelessWidget {
  const UsageControlDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(
      builder: (usageCtrl) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    DesktopSwitchCommon(
                        title: fonts.allowCreatingBroadcast,
                        value: usageCtrl.usageCtrl[
                        "allow_creating_broadcast"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "allow_creating_broadcast"] =
                              val;
                          usageCtrl.update();
                        }),
                    DesktopSwitchCommon(
                      title: fonts.allowCreatingGroup,
                      value: usageCtrl
                          .usageCtrl["allow_creating_group"],
                      onChanged: (val) {
                        usageCtrl.usageCtrl[
                        "allow_creating_group"] = val;
                        usageCtrl.update();
                      },
                    ),
                    DesktopSwitchCommon(
                        title: fonts.allowCreatingStatus,
                        value: usageCtrl.usageCtrl[
                        "allow_creating_status"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "allow_creating_status"] = val;
                          usageCtrl.update();
                        })
                  ]).paddingOnly(bottom: Insets.i20),
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    DesktopSwitchCommon(
                        title: fonts.callsAllowed,
                        value: usageCtrl
                            .usageCtrl["calls_allowed"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "calls_allowed"] = val;
                          usageCtrl.update();
                        }),
                    DesktopSwitchCommon(
                        title: fonts.existenceUser,
                        value: usageCtrl
                            .usageCtrl["existence_users"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "existence_users"] = val;
                          usageCtrl.update();
                        }),
                    DesktopSwitchCommon(
                        title: fonts.mediaSendAllowed,
                        value: usageCtrl
                            .usageCtrl["media_send_allowed"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "media_send_allowed"] = val;
                          usageCtrl.update();
                        })
                  ]).paddingOnly(bottom: Insets.i20),
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    DesktopSwitchCommon(
                        title: fonts.showLogoutButton,
                        value: usageCtrl
                            .usageCtrl["show_logout_button"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "show_logout_button"] = val;
                          usageCtrl.update();
                        }),
                    DesktopSwitchCommon(
                        title: fonts.textMessageAllowed,
                        value: usageCtrl
                            .usageCtrl["text_message_allowed"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "text_message_allowed"] = val;
                          usageCtrl.update();
                        }),
                    DesktopSwitchCommon(
                        title: fonts.allowUserSignup,
                        value: usageCtrl
                            .usageCtrl["allow_user_signup"],
                        onChanged: (val) {
                          usageCtrl.usageCtrl[
                          "allow_user_signup"] = val;
                          usageCtrl.update();
                        }),
                  ]).paddingOnly(bottom: Insets.i20),
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        validator: (number) => Validation()
                            .groupValidation(number),
                        title: fonts.groupMemberLimit,
                        controller:
                        usageCtrl.groupMemberLimit),
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        validator: (number) => Validation()
                            .maxContactValidation(number),
                        title: fonts.maxContactSelectForward,
                        controller: usageCtrl
                            .maxContactSelectForward),
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        validator: (number) => Validation()
                            .maxFileValidation(number),
                        title: fonts.maxFileSize,
                        controller: usageCtrl.maxFileSize)
                  ]).paddingOnly(bottom: Insets.i20),
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        validator: (number) => Validation()
                            .maxFileMultiValidation(number),
                        title: fonts.maxFileMultiShare,
                        controller:
                        usageCtrl.maxFileMultiShare),
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        isNote: true,
                        validator: (number) => Validation()
                            .statusValidation(number),
                        title: fonts.statusDeleteTime,
                        controller:
                        usageCtrl.statusDeleteTime),
                    DesktopTextFieldCommon(
                        width: Sizes.s200,
                        validator: (number) => Validation()
                            .broadCastValidation(number),
                        title: fonts.broadcastMemberLimit,
                        controller:
                        usageCtrl.broadCastMemberLimit)
                  ]).paddingOnly(bottom: Insets.i20)
            ]).paddingAll(Insets.i15);
      }
    );
  }
}
