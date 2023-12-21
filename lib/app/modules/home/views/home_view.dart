import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_buy/app/data/service.dart';
import 'package:swift_buy/app/modules/Login/views/login_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Are you sure you want to Leave",
                        middleText: "",
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                authService.signOut();
                                Get.to(() => const LoginView());
                              },
                              child: const Text('Yes')),
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('No'))
                        ]);
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          FutureBuilder(
            future: dataService.getProducts(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: Center(
                        child: GridView.count(
                          crossAxisCount: 2,
                          children:
                              List.generate(snapshot.data!.length, (index) {
                            return Row(
                              children: [
                                Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data?[index].image ??
                                                  "")),
                                      color: const Color.fromARGB(
                                          255, 210, 213, 216),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                const Divider(),
                              ],
                            );
                          }),
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.black,
                    );
            },
          )
        ],
      ),
    ));
  }
}
