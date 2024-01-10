import 'package:get/get.dart';
import 'controllers/common_controller/app_controller.dart';
export 'package:chatify_admin/routes/screen_list.dart';
export 'package:get/get.dart';
export 'controllers/common_controller/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get_storage/get_storage.dart';
export 'package:image_picker/image_picker.dart';
export 'package:chatify_admin/responsive.dart';
export 'package:chatify_admin/controllers/index.dart';
export 'package:chatify_admin/package_list.dart';

// All extension
export 'package:chatify_admin/extensions/text_style_extensions.dart';
export 'package:chatify_admin/extensions/widget_extension.dart';
export 'package:chatify_admin/extensions/spacing.dart';
export 'package:chatify_admin/utils/extensions.dart';

// All common files
export 'package:chatify_admin/common/theme/app_theme.dart';
export 'package:chatify_admin/common/theme/theme_service.dart';
export 'package:chatify_admin/common/theme/app_css.dart';
export 'package:chatify_admin/common/config.dart';

// All Screens
export 'package:chatify_admin/screens/auth_login_screen/layouts/glass_morphic_border.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/login_gradient.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/glass_morphic_layout.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/validator.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/switch_common.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/text_field_common.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/desktop_switch_common.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/desktop_text_field_common.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/usage_control_desktop.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/usage_control_mobile.dart';
export 'package:chatify_admin/screens/usage_control_screen/layouts/button_layout.dart';
export 'package:chatify_admin/screens/user_app_settings_screen/layouts/user_app_settings_desktop.dart';
export 'package:chatify_admin/screens/user_app_settings_screen/layouts/user_app_settings_mobile.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/dark_language_layout.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/login_layout.dart';
export 'package:chatify_admin/screens/add_user_screen/layouts/text_field_desktop.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/dark_mode_layout.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/language_layout.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/login_body_layout.dart';
export 'package:chatify_admin/screens/auth_login_screen/layouts/login_class.dart';
export 'package:chatify_admin/screens/index/layouts/drawer.dart';
export 'package:chatify_admin/screens/index/layouts/drawer_list.dart';
export 'package:chatify_admin/screens/index/layouts/leading_row.dart';
export 'package:chatify_admin/screens/index/layouts/selected_body_layout.dart';


// All widgets library
export 'package:chatify_admin/widgets/button_common.dart';
export 'package:chatify_admin/widgets/common_dotted_border.dart';
export 'package:chatify_admin/widgets/drag_drop_layout.dart';
export 'package:chatify_admin/widgets/image_pick_up.dart';
export 'package:chatify_admin/widgets/custom_snack_bar.dart';
export 'package:chatify_admin/widgets/common_text_box.dart';
export 'package:chatify_admin/widgets/common_button.dart';
export 'package:chatify_admin/widgets/text_field_validation.dart';
export 'package:chatify_admin/widgets/helper_function.dart';
export 'package:chatify_admin/screens/admin_status_screen/layouts/status_model.dart';

// All screens library
export 'package:chatify_admin/screens/dashboard/dashboard.dart';
export 'package:chatify_admin/screens/user_app_settings_screen/user_app_settings_screen.dart';
export 'package:chatify_admin/screens/admin_status_screen/admin_status_screen.dart';
export 'package:chatify_admin/screens/usage_control_screen/usage_control_screen.dart';
export 'package:chatify_admin/screens/index/index.dart';
import 'package:encrypt/encrypt.dart' as encrypt;


var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());




final encryptKey = encrypt.Key.fromUtf8('my 32 length key................');
final iv = encrypt.IV.fromLength(16);
final encrypter = encrypt.Encrypter(encrypt.AES(encryptKey));

String decryptMessage(content) {
  return encrypter.decrypt(encrypt.Encrypted.fromBase64(content), iv: iv);
}