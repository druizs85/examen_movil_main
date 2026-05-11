import 'package:flutter/material.dart';

import '../../models/proveedores.dart';

class CardProveedor extends StatelessWidget {
  final ListadoProveedor proveedor;

  const CardProveedor({super.key, required this.proveedor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),

        width: double.infinity,
        height: 150,

        decoration: _cardDecoration(),

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                '${proveedor.providerName} ${proveedor.providerLastName}',

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(proveedor.providerMail),

              const SizedBox(height: 10),

              Text('Estado: ${proveedor.providerState}'),
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
