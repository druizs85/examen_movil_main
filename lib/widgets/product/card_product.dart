import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product/detail_product.dart';
import 'package:flutter_application_1/widgets/product/image_product.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

import '../../models/productos.dart' show Listado;

class CardProduct extends StatelessWidget {
  final Listado product;
  const CardProduct({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        decoration: _cardDecoration(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImageProduct(url: product.productImage),
            DetailProduct(productName: product.productName),
            PriceProduct(productPrice: product.productPrice),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);
