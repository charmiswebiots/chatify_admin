import 'dart:developer';

import 'package:chatify_admin/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/helper_function.dart';

class UsageControlController extends GetxController {
     dynamic usageCtrl;
     bool isLoading = false;
     TextEditingController broadCastMemberLimit = TextEditingController();
     TextEditingController groupMemberLimit = TextEditingController();
     TextEditingController maxContactSelectForward = TextEditingController();
     TextEditingController maxFileSize = TextEditingController();
     TextEditingController maxFileMultiShare = TextEditingController();
     TextEditingController statusDeleteTime = TextEditingController();
     GlobalKey<FormState> formKey = GlobalKey<FormState>();

     //get data from firebase
     getData() async {
       final usageControls = await FirebaseFirestore.instance
           .collection(collectionName.admin)
           .doc(collectionName.usageControls)
           .get();
       usageCtrl = usageControls.data();
       broadCastMemberLimit.text = usageCtrl["broad_cast_members_limit"].toString();
       groupMemberLimit.text = usageCtrl["group_member_limit"].toString();
       maxContactSelectForward.text = usageCtrl["max_contact_select_forward"].toString();
       maxFileSize.text = usageCtrl["max_file_size"].toString();
       maxFileMultiShare.text = usageCtrl["max_files_multi_share"].toString();
       statusDeleteTime.text = usageCtrl["status_delete_time"];
       update();
     }

     //update data
     updateData() async {

      if(formKey.currentState!.validate()) {
        usageCtrl["broad_cast_members_limit"] = int.parse(broadCastMemberLimit.text);
        usageCtrl["group_member_limit"] = int.parse(groupMemberLimit.text);
        usageCtrl["max_contact_select_forward"] = int.parse(maxContactSelectForward.text);
        usageCtrl["max_file_size"] = int.parse(maxFileSize.text);
        usageCtrl["max_files_multi_share"] = int.parse(maxFileMultiShare.text);
        usageCtrl["status_delete_time"] = statusDeleteTime.text;

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
              .doc(collectionName.usageControls)
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