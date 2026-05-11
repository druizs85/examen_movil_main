import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:flutter_application_1/screens/loadinng_screen.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:flutter_application_1/widgets/proveedores/card_proveedor.dart';
import 'package:provider/provider.dart';

class ListProveedorScreen extends StatelessWidget {
  const ListProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);

    if (proveedorService.isLoading) {
      return const LoadinngScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado Proveedores',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: proveedorService.proveedores.length,

        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              proveedorService.selectProveedor = proveedorService
                  .proveedores[index]
                  .copy();

              Navigator.pushNamed(context, 'edit_proveedor');
            },

            child: CardProveedor(
              proveedor: proveedorService.proveedores[index],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),

        onPressed: () {
          proveedorService.selectProveedor = ListadoProveedor(
            providerId: 0,

            providerName: '',

            providerLastName: '',

            providerMail: '',

            providerState: '',
          );

          Navigator.pushNamed(context, 'edit_proveedor');
        },
      ),
    );
  }
}
