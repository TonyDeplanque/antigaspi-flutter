import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {

  final baseUrl = "http://10.0.2.2:3000";

  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/products"));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch(e) {
      print(e);
      return List.empty();
    }
  }
}
