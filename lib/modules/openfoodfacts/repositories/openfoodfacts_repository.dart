import 'package:fridge/modules/openfoodfacts/network_service.dart';
import 'package:fridge/modules/openfoodfacts/models/openfoodfacts_models.dart';

class OpenfoodfactsRepository {

  final NetworkService networkService;
  OpenfoodfactsRepository() :networkService = new NetworkService() ;

  Future<OpenfoodfactsProduct> fetchProduct(code) async {
    final productsRaw = await networkService.fetchProduct(code);
    return OpenfoodfactsProduct.fromJson(productsRaw);
  }

}
