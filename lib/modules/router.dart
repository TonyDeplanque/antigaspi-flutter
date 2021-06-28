import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge/constants/routes.dart';
import 'package:fridge/modules/product/network_service.dart';
import 'package:fridge/modules/product/blocs/products_cubit.dart';
import 'package:fridge/modules/product/repositories/product_repository.dart';
import 'package:fridge/modules/product/screens/add_product_screen.dart';
import 'package:fridge/modules/product/screens/edit_product_screen.dart';
import 'package:fridge/modules/product/screens/products_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case PRODUCTS_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => ProductsCubit(),
              child: ProductsScreen(),
            )
        );
      case ADD_PRODUCT_ROUTE:
        return MaterialPageRoute(builder: (_) => AddProductScreen());
      case EDIT_PRODUCT_ROUTE:
        return MaterialPageRoute(builder: (_) => EditProductScreen());
      default:
        return null;
    }
  }
}
