import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swift_buy/app/data/services/data_service.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put<DataService>(DataService());
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.SIGN_UP,
      getPages: AppPages.routes,
    ),
  );
}
