import 'package:bloc/bloc.dart';
import 'package:fridge/modules/openfoodfacts/models/openfoodfacts_models.dart';
import 'package:fridge/modules/openfoodfacts/repositories/openfoodfacts_repository.dart';
import 'package:meta/meta.dart';

part 'openfoodfacts_state.dart';

class OpenfoodfactsCubit extends Cubit<OpenfoodfactsState> {

  final OpenfoodfactsRepository openfoodfactsRepository;

  OpenfoodfactsCubit(): openfoodfactsRepository = new OpenfoodfactsRepository(), super(OpenfoodfactsInitial());

  void fetchProducts(code) {
    openfoodfactsRepository.fetchProduct(code).then((product) => {
      emit(OpenfoodfactsLoaded(product: product))
    });
  }
}
