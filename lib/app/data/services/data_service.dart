import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataService extends GetxService {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final url =
        Uri.parse('https://ebay-search-result.p.rapidapi.com/search/iphone');
    final headers = {
      'X-RapidAPI-Key': '553a4cb282mshc85aa0a88c50716p14965fjsnaa29c0479a3e',
      'X-RapidAPI-Host': 'ebay-search-result.p.rapidapi.com',
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
