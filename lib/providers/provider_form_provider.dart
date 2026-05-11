import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ListadoProveedor proveedor;

  ProviderFormProvider(this.proveedor);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}
