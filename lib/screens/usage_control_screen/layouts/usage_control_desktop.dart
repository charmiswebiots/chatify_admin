import 'package:chatify_admin/models/usage_control_model.dart';

import '../../../config.dart';

class UsageControlDesktop extends StatelessWidget {
  final UsageControlModel? usageControlModel;
  const UsageControlDesktop({Key? key,this.usageControlModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(
      builder: (usageCtrl) {
        return   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(fonts.usageOption.tr,style: AppCss.poppinsSemiBold18.textColor(appCtrl.appTheme.blackColor).letterSpace(.3),).marginSymmetric(horizontal: Insets.i30),
              const VSpace(Sizes.s10),
              Divider(color: appCtrl.appTheme.primary.withOpacity(0.1)),
              IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                DesktopSwitchCommon(
                                    title: fonts.allowCreatingBroadcast,
                                    value: usageControlModel!.allowCreatingBroadcast,
                                    onChanged: (val) => usageCtrl.onChangeSwitcher("allowCreatingBroadcast", val)),
                                DesktopSwitchCommon(
                                    title: fonts.allowCreatingGroup,
                                    value: usageControlModel!.allowCreatingGroup,
                                    onChanged: (val)=> usageCtrl.onChangeSwitcher("allowCreatingGroup", val)
                                ),
                                DesktopSwitchCommon(
                                    title: fonts.allowCreatingStatus,
                                    value: usageControlModel!.allowCreatingStatus,
                                    onChanged: (val) => usageCtrl.onChangeSwitcher("allowCreatingStatus", val)),
                                DesktopSwitchCommon(
                                    title: fonts.callsAllowed,
                                    value: usageControlModel!.callsAllowed,
                                    onChanged: (val)  => usageCtrl.onChangeSwitcher("callsAllowed", val)),
                                DesktopSwitchCommon(
                                    isDivider: true,
                                    title: fonts.existenceUser,
                                    value: usageControlModel!.existenceUsers,
                                    onChanged: (val)  => usageCtrl.onChangeSwitcher("existenceUsers", val)),
                              ]),
                        ),
                        VerticalDivider(width: 1,color: appCtrl.appTheme.primary.withOpacity(0.1)).paddingSymmetric(horizontal: Insets.i30),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                DesktopSwitchCommon(
                                    title: fonts.mediaSendAllowed,
                                    value: usageControlModel!.mediaSendAllowed,
                                    onChanged: (val) => usageCtrl.onChangeSwitcher("mediaSendAllowed", val)),
                                DesktopSwitchCommon(
                                    title: fonts.showLogoutButton,
                                    value: usageControlModel!.showLogoutButton,
                                    onChanged: (val) => usageCtrl.onChangeSwitcher("showLogoutButton", val)),
                                DesktopSwitchCommon(
                                    title: fonts.textMessageAllowed,
                                    value: usageControlModel!.textMessageAllowed,
                                    onChanged: (val) => usageCtrl.onChangeSwitcher("textMessageAllowed", val)),
                                DesktopSwitchCommon(
                                    isDivider: true,
                                    title: fonts.allowUserSignup,
                                    value: usageControlModel!.allowUserSignup,
                                    onChanged: (val)=> usageCtrl.onChangeSwitcher("allowUserSignup", val)),
                              ]),
                        )
                      ]
                  )
              )
            ]).marginOnly(top: Insets.i15);
      }
    );
  }
}
