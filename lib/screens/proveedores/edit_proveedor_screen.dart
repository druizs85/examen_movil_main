import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:provider/provider.dart';

class EditProveedorScreen extends StatelessWidget {
  const EditProveedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);

    return _EditProveedorBody(proveedorService: proveedorService);
  }
}

class _EditProveedorBody extends StatelessWidget {
  final ProveedorService proveedorService;

  const _EditProveedorBody({required this.proveedorService});

  @override
  Widget build(BuildContext context) {
    final proveedor = proveedorService.selectProveedor!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          proveedor.providerId == 0 ? 'Nuevo Proveedor' : 'Detalle Proveedor',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            TextFormField(
              initialValue: proveedor.providerName,

              decoration: InputDecoration(labelText: 'Nombre'),

              onChanged: (value) {
                proveedor.providerName = value;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              initialValue: proveedor.providerLastName,

              decoration: InputDecoration(labelText: 'Apellido'),

              onChanged: (value) {
                proveedor.providerLastName = value;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              initialValue: proveedor.providerMail,

              decoration: InputDecoration(labelText: 'Correo'),

              onChanged: (value) {
                proveedor.providerMail = value;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              initialValue: proveedor.providerState,

              decoration: InputDecoration(labelText: 'Estado'),

              onChanged: (value) {
                proveedor.providerState = value;
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            heroTag: 'btnDeleteProveedor',

            child: Icon(Icons.delete, color: Colors.red),

            onPressed: () async {
              await proveedorService.deleteProveedor(proveedor, context);
            },
          ),

          SizedBox(width: 20),

          FloatingActionButton(
            heroTag: 'btnSaveProveedor',

            child: Icon(Icons.save, color: Colors.green),

            onPressed: () async {
              await proveedorService.editOrCreateProveedor(proveedor);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
