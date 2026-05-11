import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';
import 'package:flutter_application_1/screens/loadinng_screen.dart';
import 'package:flutter_application_1/services/categorias_services.dart';
import 'package:flutter_application_1/widgets/categorias/card_categorias.dart';
import 'package:provider/provider.dart';

class ListCategoriaScreen extends StatelessWidget {
  const ListCategoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);

    if (categoriaService.isLoading) {
      return const LoadinngScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Categorías',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),

      body: categoriaService.categorias.isEmpty
          ? const Center(child: Text('No hay categorías disponibles'))
          : ListView.builder(
              itemCount: categoriaService.categorias.length,

              itemBuilder: (BuildContext context, int index) {
                final categoria = categoriaService.categorias[index];

                return GestureDetector(
                  onTap: () {
                    categoriaService.selectCategoria = categoria.copy();

                    Navigator.pushNamed(context, 'edit_categoria');
                  },

                  child: CardCateoria(categoria: categoria),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),

        onPressed: () {
          categoriaService.selectCategoria = Listado(
            categoryId: 0,

            categoryName: '',

            categoryState: '',
          );

          Navigator.pushNamed(context, 'edit_categoria');
        },
      ),
    );
  }
}
