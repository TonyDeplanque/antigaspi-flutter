import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge/modules/openfoodfacts/blocs/openfoodfacts_cubit.dart';

class ProductScreen extends StatelessWidget {

  final String code;

  ProductScreen({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(code),
      ),
        body: BlocConsumer<OpenfoodfactsCubit, OpenfoodfactsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            if (!(state is OpenfoodfactsLoaded)) {
              return CircularProgressIndicator();
            }

            final product = (state as OpenfoodfactsLoaded).product;

            return Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    "Nom :" + product.product.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text("Catégories :" + product.product.categories),
                  const SizedBox(height: 30),
                  Image.network(product.product.smallImageUrl)
                ]
            );
          },
        )
    );
  }
}
