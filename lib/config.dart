import 'package:get/get.dart';
import 'controllers/common_controller/app_controller.dart';
export 'package:chatify_admin/routes/screen_list.dart';
export 'package:get/get.dart';
export 'controllers/common_controller/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get_storage/get_storage.dart';
export 'package:chatify_admin/common/theme/app_theme.dart';
export 'package:chatify_admin/common/theme/theme_service.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());