import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swift_buy/app/modules/home/carts_model.dart';
import 'package:swift_buy/app/modules/home/products_model.dart';

class DataService extends GetxService {
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<List<Products>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Products> products =
          jsonResponse.map((json) => Products.fromJson(json)).toList();

      return products;
    } else {
      throw Exception("Failed to Load Products");
    }
  }
}
