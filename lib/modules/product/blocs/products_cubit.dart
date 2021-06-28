import 'package:bloc/bloc.dart';
import 'package:fridge/modules/product/models/product_models.dart';
import 'package:fridge/modules/product/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  final ProductRepository productRepository;

  ProductsCubit(): productRepository = new ProductRepository(), super(ProductsInitial());

  void fetchProducts() {
    productRepository.fetchProducts().then((products) => {
      emit(ProductsLoaded(products: products))
    });
  }
}
