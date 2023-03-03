import 'dart:developer';
import '../../config.dart';

class UserAppSettingsController extends GetxController {

  dynamic usageCtrl;
  bool isLoading = false;
  TextEditingController approvalMessage = TextEditingController();
  TextEditingController maintenanceMessage = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  //get data from firebase
  getData() async {
    final usageControls = await FirebaseFirestore.instance
        .collection(collectionName.admin)
        .doc(collectionName.userAppSettings)
        .get();
    log("get data: $usageControls");
    usageCtrl = usageControls.data();
    log("get data In: $usageCtrl");
    approvalMessage.text = usageCtrl["approval_message"].toString();
     maintenanceMessage.text = usageCtrl["maintenance_message"].toString();
    update();
  }

  //update data
  updateData() async {

    if(formKey.currentState!.validate()) {

      usageCtrl["approval_message"] = approvalMessage.text;
      usageCtrl["maintenance_message"] = maintenanceMessage.text;

      log("usage: $usageCtrl");
      bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
      if (isLoginTest) {
        accessDenied(fonts.modification.tr);
      }else {
        isLoading = true;
        log("usage2: $usageCtrl");
        update();
        await FirebaseFirestore.instance
            .collection(collectionName.admin)
            .doc(collectionName.userAppSettings)
            .update(usageCtrl).then((value) {
          log("collectionName: ${collectionName.admin}");
          log("collectionNiAndar: ${collectionName.userAppSettings}");
          log("usage3: $usageCtrl");
          isLoading = false;
          update();
        });
        update();
        getData();
      }
    }
  }
  @override
  void onReady() {
    getData();
    update();
    // TODO: implement onReady
    super.onReady();
  }
}