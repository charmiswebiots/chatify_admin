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
export 'package:chatify_admin/screens/dashboard/dashboard.dart';


export '../../../widgets/custom_snack_bar.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());