import 'dart:ffi';

class Product {
  String name;
  String id;
  int price;

  Product.fromJson(Map json) :
      name = json["name"],
      id = json["id"],
      price = json["price"] as int;
}
