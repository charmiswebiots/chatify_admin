import 'dart:developer';

import 'package:chatify_admin/models/usage_control_model.dart';
import 'package:chatify_admin/screens/usage_control_screen/layouts/usage_control_text_box_desktop.dart';
import 'package:chatify_admin/screens/user_app_settings_screen/layouts/all_text_box_desktop.dart';
import 'package:chatify_admin/screens/usage_control_screen/layouts/usage_control_responsive.dart';

import '../../config.dart';

class UsageControlScreen extends StatelessWidget {
  final usageCtrl = Get.put(UsageControlController());

  UsageControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UsageControlController>(builder: (_) {
      if (usageCtrl.usageCtrl != null) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(collectionName.config).doc(collectionName.usageControls)
                .snapshots(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {

                usageCtrl.usageCtrl = UsageControlModel.fromJson(snapShot.data!.data()!);
                return SingleChildScrollView(
                    child: Stack(alignment: Alignment.center, children: [
                  Form(
                      key: usageCtrl.formKey,
                      child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            UsageControlResponsive(configModel: usageCtrl.usageCtrl),
                            const VSpace(Sizes.s20),
                            if (Responsive.isDesktop(context))
                              const UsageControlAllTextBoxDesktop(),
                            // Update button & Note
                            ButtonLayout(onTap: () => usageCtrl.updateData())
                          ])
                          .paddingSymmetric(
                              horizontal: Responsive.isDesktop(context)
                                  ? Insets.i100
                                  : Insets.i30,
                              vertical: Insets.i25)
                          .boxExtension()),
                  if (usageCtrl.isLoading)
                    Center(
                        child: CircularProgressIndicator(
                            color: appCtrl.appTheme.primary))
                ]));
              } else {
                return Container();
              }
            });
      } else {
        return Container();
      }
    });
  }
}
