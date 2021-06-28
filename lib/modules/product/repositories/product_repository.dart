import 'package:fridge/modules/product/network_service.dart';
import 'package:fridge/modules/product/models/product_models.dart';

class ProductRepository {

  final NetworkService networkService;
  ProductRepository() :networkService = new NetworkService() ;

  Future<List<Product>> fetchProducts() async {
    final productsRaw = await networkService.fetchProducts();
    return productsRaw.map((json) => Product.fromJson(json)).toList();
  }

}
