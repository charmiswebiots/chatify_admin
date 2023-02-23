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
                  child: SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                        Responsive.isMobile(context) ||
                                Responsive.isTablet(context)
                        // Mobile view
                            ? const UsageControlMobile()
                        // Desktop view
                            : const UsageControlDesktop(),

                            // Update button & Note
                            ButtonLayout(isNote: true,onPressed: () => usageCtrl.updateData())
                      ])).boxExtension()),
              if (usageCtrl.isLoading)
                Center(child: CircularProgressIndicator(color: appCtrl.appTheme.primary))
            ])
          : Center(
              child:
                  CircularProgressIndicator(color: appCtrl.appTheme.primary));
    });
  }
}
