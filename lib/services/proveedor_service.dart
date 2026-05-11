import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'package:http/http.dart' as http;

class ProveedorService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';

  final String _user = 'test';
  final String _pass = 'test2023';

  List<ListadoProveedor> proveedores = [];

  ListadoProveedor? selectProveedor;

  bool isLoading = true;
  bool isEditCreate = false;

  ProveedorService() {
    loadProveedor();
  }

  Future loadProveedor() async {
    isLoading = true;

    notifyListeners();

    try {
      final url = Uri.http(_baseUrl, '/ejemplos/provider_list_rest/');

      String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

      final response = await http.get(
        url,

        headers: {'authorization': basicAuth},
      );

      print(response.body);

      final proveedorMap = Proveedor.fromJson(response.body);

      proveedores = proveedorMap.listado;

      print('PROVEEDORES: ${proveedores.length}');
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future editOrCreateProveedor(ListadoProveedor proveedor) async {
    isEditCreate = true;

    notifyListeners();

    if (proveedor.providerId == 0) {
      await createProveedor(proveedor);
    } else {
      await updateProveedor(proveedor);
    }

    isEditCreate = false;

    notifyListeners();
  }

  Future updateProveedor(ListadoProveedor proveedor) async {
    final url = Uri.http(_baseUrl, '/ejemplos/provider_edit_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({
        "provider_id": proveedor.providerId,

        "provider_name": proveedor.providerName,

        "provider_last_name": proveedor.providerLastName,

        "provider_mail": proveedor.providerMail,

        "provider_state": proveedor.providerState,
      }),

      headers: {
        'authorization': basicAuth,

        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    final index = proveedores.indexWhere(
      (element) => element.providerId == proveedor.providerId,
    );

    proveedores[index] = proveedor;

    notifyListeners();

    return '';
  }

  Future createProveedor(ListadoProveedor proveedor) async {
    final url = Uri.http(_baseUrl, '/ejemplos/provider_add_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({
        "provider_name": proveedor.providerName,

        "provider_last_name": proveedor.providerLastName,

        "provider_mail": proveedor.providerMail,

        "provider_state": proveedor.providerState,
      }),

      headers: {
        'authorization': basicAuth,

        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    proveedores.add(proveedor);

    notifyListeners();

    return '';
  }

  Future deleteProveedor(
    ListadoProveedor proveedor,

    BuildContext context,
  ) async {
    final url = Uri.http(_baseUrl, '/ejemplos/provider_del_rest/');

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';

    final response = await http.post(
      url,

      body: jsonEncode({"provider_id": proveedor.providerId}),

      headers: {
        'authorization': basicAuth,

        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    proveedores.removeWhere(
      (element) => element.providerId == proveedor.providerId,
    );

    notifyListeners();

    Navigator.pop(context);

    return '';
  }
}
