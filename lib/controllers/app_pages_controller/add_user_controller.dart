import 'package:chatify_admin/config.dart';

class AddUserController extends GetxController {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final adminStatusCtrl = Get.find<AdminStatusController>();

}