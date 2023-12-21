import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_buy/app/data/service.dart';
import 'package:swift_buy/app/modules/home/views/home_view.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  RxBool checkBoxValue = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void signUp() async {
    User? user = await authService.signUpWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null) {
      print('User has been created successfully');
      Get.to(() => const HomeView());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
