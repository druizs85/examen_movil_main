import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/categorias/edit_categoria_screen.dart';
import 'package:flutter_application_1/screens/categorias/list_categorias_screen.dart';

import 'package:flutter_application_1/screens/proveedores/edit_proveedor_screen.dart';
import 'package:flutter_application_1/screens/proveedores/list_proveedores_screen.dart';

import '../screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),

    'register': (BuildContext context) => const RegisterScreen(),

    'home': (BuildContext context) => const HomeScreen(),

    // PRODUCTOS
    'list_product': (BuildContext context) => const ListProductScreen(),

    'edit_product': (BuildContext context) => const EditProductScreen(),

    // CATEGORIAS
    'list_categoria': (BuildContext context) {
      print('ENTRANDO A CATEGORIA');

      return const ListCategoriaScreen();
    },

    'edit_categoria': (BuildContext context) => const EditCategoriaScreen(),

    // PROVEEDORES
    'list_proveedor': (BuildContext context) {
      print('ENTRANDO A PROVEEDORES');

      return const ListProveedorScreen();
    },

    'edit_proveedor': (BuildContext context) => const EditProveedorScreen(),

    // ERROR
    'error': (BuildContext context) => const ErrorScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('NO ENCONTRADA: ${settings.name}');
    print('RUTAS DISPONIBLES: ${routes.keys}');

    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }
}
