import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';
import '../../widgets/helper_function.dart';

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
    usageCtrl = usageControls.data();
    approvalMessage.text = usageCtrl["approval_message"].toString();
     maintenanceMessage.text = usageCtrl["maintenance_message"].toString();
    update();
  }

  //update data
  updateData() async {

    if(formKey.currentState!.validate()) {

      usageCtrl["approval_message"] = approvalMessage.text;
      usageCtrl["maintenance_message"] = maintenanceMessage.text;

      print("usage: $usageCtrl");
      bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
      if (isLoginTest) {
        accessDenied(fonts.modification.tr);
      }else {
        isLoading = true;
        print("usage2: $usageCtrl");
        update();
        await FirebaseFirestore.instance
            .collection(collectionName.admin)
            .doc(collectionName.userAppSettings)
            .update(usageCtrl).then((value) {
          print("usage3: $usageCtrl");
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