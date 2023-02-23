import '../../config.dart';

class UserAppSettingsScreen extends StatelessWidget {
  final userSettingCtrl = Get.put(UserAppSettingsController());

  UserAppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAppSettingsController>(builder: (userSettingCtrl) {
      return userSettingCtrl.usageCtrl != null
          ? Stack(alignment: Alignment.center, children: [
              Form(
                  key: userSettingCtrl.formKey,
                  child: SizedBox(
                      child: Column(children: [
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? const UserAppSettingsMobile()
                        : const UserAppSettingsDesktop(),
                    ButtonLayout(onPressed: () => userSettingCtrl.updateData())
                  ])).boxExtension()),
              if (userSettingCtrl.isLoading)
                Center(
                    child: CircularProgressIndicator(
                        color: appCtrl.appTheme.primary))
            ])
          : Center(
              child:
                  CircularProgressIndicator(color: appCtrl.appTheme.primary));
    });
  }
}
