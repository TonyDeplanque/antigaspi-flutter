import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkService {

  final baseUrl = "https://world.openfoodfacts.org/api/v0";

  Future<dynamic> fetchProduct(code) async {
    try {
      final response = await get(Uri.parse(baseUrl + "/product/" + code + ".json"));
      return jsonDecode(response.body);
    } catch(e) {
      print(e);
      return null;
    }
  }
}
