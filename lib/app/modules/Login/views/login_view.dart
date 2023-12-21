import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swift_buy/app/modules/SignUp/views/sign_up_view.dart';
import 'package:swift_buy/app/widgets/details_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Welcome\nBack',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to continue',
                style: TextStyle(color: Color.fromARGB(255, 146, 141, 141)),
              ),
              const SizedBox(height: 30),
              DetailsFeild(
                hintText: 'email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),
              DetailsFeild(
                hintText: 'password',
                controller: controller.passwordController,
              ),
              const SizedBox(height: 40),
              const Align(
                  child: Text(
                'Forgot Password?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )),
              const SizedBox(height: 30),
              Align(
                child: OutlinedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 90)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      side: MaterialStateProperty.all(const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                          style: BorderStyle.solid))),
                  onPressed: () {},
                  child: const Text(
                    'Sign in with Facebook',
                    style: TextStyle(
                        color: Color.fromARGB(255, 17, 120, 210), fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create new account?'),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpView());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Align(
                  child: ElevatedButton(
                      onPressed: controller.signIn,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 160),
                      ),
                      child: const Text('Login')))
            ],
          ),
        ));
  }
}
