import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_buy/app/data/services/auth_service.dart';
import 'package:swift_buy/app/data/services/data_service.dart';
import 'package:swift_buy/app/modules/Login/controllers/login_controller.dart';
import 'package:swift_buy/app/modules/SignUp/controllers/sign_up_controller.dart';
import 'package:swift_buy/firebase_options.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<DataService>(DataService());
  Get.lazyPut(() => SignUpController());
  Get.put(LoginController());
  Get.put(AuthService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
