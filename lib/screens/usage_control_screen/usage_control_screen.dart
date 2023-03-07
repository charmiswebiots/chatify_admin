import '../../config.dart';

class UsageControlScreen extends StatelessWidget {
  final usageCtrl = Get.put(UsageControlController());

  UsageControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsageControlController>(builder: (_) {
      return usageCtrl.usageCtrl != null
          ? Stack(alignment: Alignment.center, children: [
              Form(
                  key: usageCtrl.formKey,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  Responsive.isMobile(context) ||
                                          Responsive.isTablet(context)
                                  // Mobile view
                                      ? const UsageControlMobile()
                                  // Desktop view
                                      : const UsageControlDesktop(),


                                ])).boxExtension(),
                            const HSpace(Sizes.s20),
                            SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                          DesktopTextFieldCommon(
                                  width: Sizes.s236,
                                  validator: (number) => Validation()
                                      .groupValidation(number),
                                  title: fonts.groupMemberLimit,
                                  controller:
                                  usageCtrl.groupMemberLimit),
                          const VSpace(Sizes.s30),
                          DesktopTextFieldCommon(
                                  width: Sizes.s236,
                                  validator: (number) => Validation()
                                      .maxContactValidation(number),
                                  title: fonts.maxContactSelectForward,
                                  controller: usageCtrl
                                      .maxContactSelectForward),
                                    const VSpace(Sizes.s30),
                          DesktopTextFieldCommon(
                                  width: Sizes.s236,
                                  validator: (number) => Validation()
                                      .maxFileValidation(number),
                                  title: fonts.maxFileSize,
                                  controller: usageCtrl.maxFileSize)
                                  ],
                                ),
                                const HSpace(Sizes.s30),
                                Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      DesktopTextFieldCommon(
                                          width: Sizes.s236,
                                          validator: (number) => Validation()
                                              .maxFileMultiValidation(number),
                                          title: fonts.maxFileMultiShare,
                                          controller:
                                          usageCtrl.maxFileMultiShare),
                                      const VSpace(Sizes.s30),
                                      DesktopTextFieldCommon(
                                          width: Sizes.s236,
                                          isNote: true,
                                          validator: (number) => Validation()
                                              .statusValidation(number),
                                          title: fonts.statusDeleteTime,
                                          controller:
                                          usageCtrl.statusDeleteTime),
                                      const VSpace(Sizes.s30),
                                      DesktopTextFieldCommon(
                                          width: Sizes.s236,
                                          validator: (number) => Validation()
                                              .broadCastValidation(number),
                                          title: fonts.broadcastMemberLimit,
                                          controller:
                                          usageCtrl.broadCastMemberLimit)
                                    ]),
                              ],
                            ).paddingAll(Insets.i30),
                            ).boxExtension()
                          ]
                        )
                      ),
                        // Update button & Note
                      ButtonLayout(isNote: true,onTap: () => usageCtrl.updateData())
                    ]
                  )),
              if (usageCtrl.isLoading)
                Center(child: CircularProgressIndicator(color: appCtrl.appTheme.primary))
            ])
          : Center(
              child:
                  CircularProgressIndicator(color: appCtrl.appTheme.primary));
    });
  }
}
