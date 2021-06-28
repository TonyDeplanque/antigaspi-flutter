import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge/modules/openfoodfacts/blocs/openfoodfacts_cubit.dart';
import 'package:fridge/modules/openfoodfacts/repositories/openfoodfacts_repository.dart';
import 'package:fridge/modules/product/screens/product_screen.dart';

class AddProductScreen extends StatelessWidget {

  Future<void> startBarcodeScanStream(context) async {
    String barcode;

    try {
      barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcode);
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<OpenfoodfactsCubit>(create: (_) => OpenfoodfactsCubit()..fetchProducts(barcode)),
        ],
        child: ProductScreen(code: barcode)
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout d'un produit"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => { startBarcodeScanStream(context) },
              child: Icon(Icons.camera),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              )
            ),
            const SizedBox(height: 30),
            Text("ou", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: null,
              child: Text(
                  "Manuellement"
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
              ),
          ],
        )
      )
    );
  }

}
