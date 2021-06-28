import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge/constants/routes.dart';
import 'package:fridge/modules/product/blocs/products_cubit.dart';
import 'package:fridge/modules/product/models/product_models.dart';

class ProductsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).fetchProducts();


    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          actions: [
            InkWell(
                onTap: () => Navigator.pushNamed(context, ADD_PRODUCT_ROUTE),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.add)
                )
            )
          ],
        ),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            if (!(state is ProductsLoaded)) {
              return CircularProgressIndicator();
            }

            final products = (state as ProductsLoaded).products;

            return SingleChildScrollView(
                child: Column(
                  children: products.map((p) => _product(p)).toList(),
                )
            );
          },
        )
    );
  }

  Widget _product(Product product) {
    return ListTile(
      title: Text(product.name),
    );
  }

}
