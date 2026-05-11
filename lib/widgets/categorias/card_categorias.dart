import 'package:flutter/material.dart';

import '../../models/categorias.dart' show Listado;

class CardCateoria extends StatelessWidget {
  final Listado categoria;

  const CardCateoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),

        width: double.infinity,
        height: 120,

        decoration: _cardDecoration(),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                categoria.categoryName,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Estado: ${categoria.categoryState}',

                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
  color: Colors.white,

  borderRadius: BorderRadius.circular(25),

  boxShadow: const [
    BoxShadow(color: Colors.black26, offset: Offset(0, 5), blurRadius: 10),
  ],
);
