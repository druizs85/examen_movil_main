import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';
import 'package:http/http.dart' as http;

class CategoriaService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';

  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> categorias = [];

  Listado? selectCategoria;

  bool isLoading = true;
  bool isEditCreate = false;

  CategoriaService() {
    loadCategoria();
  }

  Future loadCategoria() async {
    isLoading = true;

    notifyListeners();

    try {
      final url = Uri.http(_baseUrl, '/ejemplos/category_list_rest/');

      String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

      final response = await http.get(
        url,
        headers: {'authorization': basicAuth},
      );

      final categoriaMap = Categoria.fromJson(response.body);

      categorias = categoriaMap.listado;

      print('CATEGORIAS: ${categorias.length}');
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future editOrCreateCategoria(Listado categoria) async {
    isEditCreate = true;

    notifyListeners();

    if (categoria.categoryId == 0) {
      await createCategoria(categoria);
    } else {
      await updateCategoria(categoria);
    }

    isEditCreate = false;

    notifyListeners();
  }

  Future updateCategoria(Listado categoria) async {
    final url = Uri.http(_baseUrl, '/ejemplos/category_edit_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({
        "category_id": categoria.categoryId,
        "category_name": categoria.categoryName,
        "category_state": categoria.categoryState,
      }),

      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    final index = categorias.indexWhere(
      (element) => element.categoryId == categoria.categoryId,
    );

    categorias[index] = categoria;

    notifyListeners();

    return '';
  }

  Future createCategoria(Listado categoria) async {
    final url = Uri.http(_baseUrl, '/ejemplos/category_add_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({"category_name": categoria.categoryName}),

      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    categorias.add(categoria);

    notifyListeners();

    return '';
  }

  Future deleteCategoria(Listado categoria, BuildContext context) async {
    final url = Uri.http(_baseUrl, '/ejemplos/category_del_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({"category_id": categoria.categoryId}),

      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    categorias.removeWhere(
      (element) => element.categoryId == categoria.categoryId,
    );

    notifyListeners();

    Navigator.pop(context);

    return '';
  }
}
