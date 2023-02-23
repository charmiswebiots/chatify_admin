import 'package:get/get.dart';
import 'controllers/common_controller/app_controller.dart';
export 'package:chatify_admin/routes/screen_list.dart';
export 'package:get/get.dart';
export 'controllers/common_controller/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get_storage/get_storage.dart';
export 'package:chatify_admin/responsive.dart';
export '../../../controllers/index.dart';

// All extension
export 'package:chatify_admin/extensions/text_style_extensions.dart';
export 'package:chatify_admin/extensions/widget_extension.dart';
export 'package:chatify_admin/extensions/spacing.dart';
export '../../../widgets/text_field_validation.dart';
export 'package:chatify_admin/utils/extensions.dart';

// All common files
export 'package:chatify_admin/common/theme/app_theme.dart';
export 'package:chatify_admin/common/theme/theme_service.dart';
export 'package:chatify_admin/common/theme/app_css.dart';
export '../../common/config.dart';

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


export 'package:chatify_admin/screens/dashboard/dashboard.dart';
export 'package:chatify_admin/screens/user_app_settings_screen/user_app_settings_screen.dart';
export '../../../widgets/custom_snack_bar.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());