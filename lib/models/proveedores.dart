import 'dart:convert';

class Proveedor {
  Proveedor({required this.listado});

  List<ListadoProveedor> listado;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(dynamic json) {
    if (json is List) {
      return Proveedor(
        listado: List<ListadoProveedor>.from(
          json.map((x) => ListadoProveedor.fromMap(x)),
        ),
      );
    }

    return Proveedor(
      listado: List<ListadoProveedor>.from(
        (json["Proveedores Listado"] ?? []).map(
          (x) => ListadoProveedor.fromMap(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() => {
    "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class ListadoProveedor {
  ListadoProveedor({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerMail,
    required this.providerState,
  });

  int providerId;
  String providerName;
  String providerLastName;
  String providerMail;
  String providerState;

  factory ListadoProveedor.fromJson(String str) =>
      ListadoProveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoProveedor.fromMap(Map<String, dynamic> json) =>
      ListadoProveedor(
        providerId: int.tryParse(json["providerid"].toString()) ?? 0,
        providerName: json["provider_name"]?.toString() ?? '',
        providerLastName: json["provider_last_name"]?.toString() ?? '',
        providerMail: json["provider_mail"]?.toString() ?? '',
        providerState: json["provider_state"]?.toString() ?? '',
      );

  Map<String, dynamic> toMap() => {
    "provider_id": providerId,
    "provider_name": providerName,
    "provider_last_name": providerLastName,
    "provider_mail": providerMail,
    "provider_state": providerState,
  };

  ListadoProveedor copy() => ListadoProveedor(
    providerId: providerId,
    providerName: providerName,
    providerLastName: providerLastName,
    providerMail: providerMail,
    providerState: providerState,
  );
}
