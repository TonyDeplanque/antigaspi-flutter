class OpenfoodfactsProduct {
  String code;
  Product product;

  OpenfoodfactsProduct.fromJson(Map json) :
        code = json["code"],
        product = Product.fromJson(json["product"]);
}

class Product {
  String id;
  String categories;
  String imageUrl;
  String smallImageUrl;
  String name;

  Product.fromJson(Map json) :
        id = json["_id"],
        categories = json["categories"],
        imageUrl = json["image_url"],
        smallImageUrl = json["image_small_url"],
        name = json["product_name"];
}
