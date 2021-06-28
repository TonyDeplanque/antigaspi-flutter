part of 'openfoodfacts_cubit.dart';

@immutable
abstract class OpenfoodfactsState {}

class OpenfoodfactsInitial extends OpenfoodfactsState {}
class OpenfoodfactsLoaded extends OpenfoodfactsState {
  final OpenfoodfactsProduct product;

  OpenfoodfactsLoaded({required this.product});
}
