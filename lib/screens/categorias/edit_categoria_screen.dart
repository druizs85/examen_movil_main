import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/categorias_services.dart';
import 'package:provider/provider.dart';

class EditCategoriaScreen extends StatelessWidget {
  const EditCategoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);

    return _EditCategoriaBody(categoriaService: categoriaService);
  }
}

class _EditCategoriaBody extends StatelessWidget {
  final CategoriaService categoriaService;

  const _EditCategoriaBody({required this.categoriaService});

  @override
  Widget build(BuildContext context) {
    final categoria = categoriaService.selectCategoria!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoria.categoryId == 0 ? 'Nueva Categoria' : 'Detalle Categoria',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            TextFormField(
              initialValue: categoria.categoryName,

              decoration: InputDecoration(labelText: 'Nombre Categoria'),

              onChanged: (value) {
                categoria.categoryName = value;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              initialValue: categoria.categoryState,

              decoration: InputDecoration(labelText: 'Estado'),

              onChanged: (value) {
                categoria.categoryState = value;
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            child: Icon(Icons.delete, color: Colors.red),

            heroTag: 'btnDelete',

            onPressed: () async {
              await categoriaService.deleteCategoria(categoria, context);
            },
          ),

          SizedBox(width: 20),

          FloatingActionButton(
            child: Icon(Icons.save, color: Colors.green),

            heroTag: 'btnSave',

            onPressed: () async {
              await categoriaService.editOrCreateCategoria(categoria);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
