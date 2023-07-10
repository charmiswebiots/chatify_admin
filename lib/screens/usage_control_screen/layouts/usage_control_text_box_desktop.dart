import '../../../config.dart';

class UsageControlAllTextBoxDesktop extends StatelessWidget {
  const UsageControlAllTextBoxDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (usageCtrl) {
      return Stack(
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DesktopTextFieldCommon(
                          width: Sizes.s236,
                          validator: (number) =>
                              Validation().groupValidation(number),
                          title: fonts.groupMemberLimit,
                          controller: usageCtrl.groupMemberLimit),
                      const VSpace(Sizes.s30),
                      DesktopTextFieldCommon(
                          width: Sizes.s236,
                          validator: (number) =>
                              Validation().maxContactValidation(number),
                          title: fonts.maxContactSelectForward,
                          controller: usageCtrl.maxContactSelectForward),
                      const VSpace(Sizes.s30),
                      DesktopTextFieldCommon(
                          width: Sizes.s236,
                          validator: (number) =>
                              Validation().maxFileValidation(number),
                          title: fonts.maxFileSize,
                          controller: usageCtrl.maxFileSize)
                    ],
                  ).marginOnly(top: Insets.i15),
                ),
                const HSpace(Sizes.s30),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      DesktopTextFieldCommon(
                          width: Sizes.s236,
                          validator: (number) =>
                              Validation().maxFileMultiValidation(number),
                          title: fonts.maxFileMultiShare,
                          controller: usageCtrl.maxFileMultiShare),
                      const VSpace(Sizes.s30),
                          DesktopTextFieldCommon(
                              width: Sizes.s236,
                              validator: (number) =>
                                  Validation().broadCastValidation(number),
                              title: fonts.broadcastMemberLimit,
                              controller: usageCtrl.broadCastMemberLimit),
                      const VSpace(Sizes.s30),
                          DesktopTextFieldCommon(
                              width: Sizes.s236,
                              isNote: true,
                              validator: (number) =>
                                  Validation().statusValidation(number),
                              title: fonts.statusDeleteTime,
                              controller: usageCtrl.statusDeleteTime),

                    ]).marginOnly(top: Insets.i15)),
              ],
            ).paddingAll(Insets.i30),
          ).boxExtension().marginOnly(top: Insets.i15),
          CommonButton(
            title: fonts.usageControl.tr,
            style: AppCss.poppinsMedium12.textColor(appCtrl.appTheme.white),
            width: Sizes.s250,
            margin: Insets.i15,
          ),
        ],
      );
    });
  }
}
