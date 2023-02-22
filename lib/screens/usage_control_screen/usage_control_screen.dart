import 'package:chatify_admin/controllers/app_pages_controller/usage_control_controller.dart';

import '../../config.dart';
import '../../widgets/text_field_validation.dart';
import 'layouts/desktop_switch_common.dart';
import 'layouts/desktop_text_field_common.dart';
import 'layouts/switch_common.dart';
import 'layouts/text_field_common.dart';

class UsageControlScreen extends StatelessWidget {
  final usageCtrl = Get.put(UsageControlController());

  UsageControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (_) {
      return usageCtrl.usageCtrl != null
          ? Form(
        key: usageCtrl.formKey,
            child: SizedBox(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? Column(
                          children: [
                            MobileSwitchCommon(
                                title: fonts.allowCreatingBroadcast,
                                value: usageCtrl
                                    .usageCtrl["allow_creating_broadcast"],
                                onChanged: (val) {
                                  usageCtrl
                                          .usageCtrl["allow_creating_broadcast"] =
                                      val;
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
                                value:
                                    usageCtrl.usageCtrl["allow_creating_status"],
                                onChanged: (val) {
                                  usageCtrl.usageCtrl["allow_creating_status"] =
                                      val;
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
                                  usageCtrl.usageCtrl["text_messag_allowed"] =
                                      val;
                                  usageCtrl.update();
                                }),
                            MobileTextFieldCommon(
                              validator:(number)=> Validation().broadCastValidation(number),
                                title: fonts.broadcastMemberLimit,
                                controller: usageCtrl.broadCastMemberLimit),
                            MobileTextFieldCommon(
                                validator:(number)=> Validation().groupValidation(number),
                                title: fonts.groupMemberMemberLimit,
                                controller: usageCtrl.groupMemberLimit),
                            MobileTextFieldCommon(
                                validator:(number)=> Validation().maxContactValidation(number),
                                title: fonts.maxContactSelectForward,
                                controller: usageCtrl.maxContactSelectForward),
                            MobileTextFieldCommon(
                                validator:(number)=> Validation().maxFileValidation(number),
                                title: fonts.maxFileSize,
                                controller: usageCtrl.maxFileSize),
                            MobileTextFieldCommon(
                                validator:(number)=> Validation().maxFileMultiValidation(number),
                                title: fonts.maxFileMultiShare,
                                controller: usageCtrl.maxFileMultiShare),
                            MobileTextFieldCommon(
                                validator:(number)=> Validation().statusValidation(number),
                                title: fonts.statusDeleteTime,
                                controller: usageCtrl.statusDeleteTime)
                          ]
                        ).paddingAll(Insets.i15)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesktopSwitchCommon(
                                    title: fonts.allowCreatingBroadcast,
                                    value: usageCtrl
                                        .usageCtrl["allow_creating_broadcast"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl[
                                          "allow_creating_broadcast"] = val;
                                      usageCtrl.update();
                                    }),
                                DesktopSwitchCommon(
                                  title: fonts.allowCreatingGroup,
                                  value:
                                      usageCtrl.usageCtrl["allow_creating_group"],
                                  onChanged: (val) {
                                    usageCtrl.usageCtrl["allow_creating_group"] =
                                        val;
                                    usageCtrl.update();
                                  },
                                ),
                                DesktopSwitchCommon(
                                    title: fonts.allowCreatingStatus,
                                    value: usageCtrl
                                        .usageCtrl["allow_creating_status"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl[
                                          "allow_creating_status"] = val;
                                      usageCtrl.update();
                                    }),
                              ],
                            ).paddingOnly(bottom: Insets.i20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesktopSwitchCommon(
                                    title: fonts.callsAllowed,
                                    value: usageCtrl.usageCtrl["calls_allowed"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl["calls_allowed"] = val;
                                      usageCtrl.update();
                                    }),
                                DesktopSwitchCommon(
                                    title: fonts.existenceUser,
                                    value: usageCtrl.usageCtrl["existence_users"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl["existence_users"] =
                                          val;
                                      usageCtrl.update();
                                    }),
                                DesktopSwitchCommon(
                                    title: fonts.mediaSendAllowed,
                                    value:
                                        usageCtrl.usageCtrl["media_send_allowed"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl["media_send_allowed"] =
                                          val;
                                      usageCtrl.update();
                                    }),
                              ],
                            ).paddingOnly(bottom: Insets.i20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesktopSwitchCommon(
                                    title: fonts.showLogoutButton,
                                    value:
                                        usageCtrl.usageCtrl["show_logout_button"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl["show_logout_button"] =
                                          val;
                                      usageCtrl.update();
                                    }),
                                DesktopSwitchCommon(
                                    title: fonts.textMessageAllowed,
                                    value: usageCtrl
                                        .usageCtrl["text_messag_allowed"],
                                    onChanged: (val) {
                                      usageCtrl.usageCtrl["text_messag_allowed"] =
                                          val;
                                      usageCtrl.update();
                                    }),
                                DesktopTextFieldCommon(
                                    validator:(number)=> Validation().broadCastValidation(number),
                                    title: fonts.broadcastMemberLimit,
                                    controller: usageCtrl.broadCastMemberLimit),
                              ],
                            ).paddingOnly(bottom: Insets.i20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DesktopTextFieldCommon(
                                    validator:(number)=> Validation().groupValidation(number),
                                    title: fonts.groupMemberMemberLimit,
                                    controller: usageCtrl.groupMemberLimit),
                                DesktopTextFieldCommon(
                                    validator:(number)=> Validation().maxContactValidation(number),
                                    title: fonts.maxContactSelectForward,
                                    controller:
                                        usageCtrl.maxContactSelectForward),
                                DesktopTextFieldCommon(
                                    validator:(number)=> Validation().maxFileValidation(number),
                                    title: fonts.maxFileSize,
                                    controller: usageCtrl.maxFileSize)
                              ],
                            ).paddingOnly(bottom: Insets.i20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DesktopTextFieldCommon(
                                      validator:(number)=> Validation().maxFileMultiValidation(number),
                                      title: fonts.maxFileMultiShare,
                                      controller: usageCtrl.maxFileMultiShare),
                                  DesktopTextFieldCommon(
                                      validator:(number)=> Validation().statusValidation(number),
                                      title: fonts.statusDeleteTime,
                                      controller: usageCtrl.statusDeleteTime),
                                ]).paddingOnly(bottom: Insets.i20)
                          ],
                        ).paddingAll(Insets.i15),
                  ElevatedButton(
                          onPressed: () => usageCtrl.updateData(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appCtrl.appTheme.primary),
                          child: Text(fonts.update.tr,
                              style: AppCss.nunitoMedium16
                                  .textColor(appCtrl.appTheme.white)))
                      .paddingOnly(
                          bottom: Insets.i20, right: Insets.i20, top: Insets.i10)
                ],
              )).decorated(
                color: appCtrl.appTheme.white,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppRadius.r8)),
                boxShadow: [
                  BoxShadow(
                      color: appCtrl.appTheme.greyLight25,
                      spreadRadius: 5,
                      blurRadius: 5)
                ],
              ),
          )
          : Center(
              child:
                  CircularProgressIndicator(color: appCtrl.appTheme.primary));
    });
  }
}
