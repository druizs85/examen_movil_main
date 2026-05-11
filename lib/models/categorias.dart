import 'dart:convert';

class Categoria {
  Categoria({required this.listado});

  List<Listado> listado;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(dynamic json) {
    // Si la API devuelve lista directa
    if (json is List) {
      return Categoria(
        listado: List<Listado>.from(json.map((x) => Listado.fromMap(x))),
      );
    }

    // Si devuelve:
    // { "Listado Categorias": [...] }

    return Categoria(
      listado: List<Listado>.from(
        (json["Listado Categorias"] ?? []).map((x) => Listado.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() => {
    "Listado Categorias": List<dynamic>.from(listado.map((x) => x.toMap())),
  };
}

class Listado {
  Listado({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  int categoryId;
  String categoryName;
  String categoryState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
    categoryId: int.tryParse(json["category_id"].toString()) ?? 0,

    categoryName: json["category_name"]?.toString() ?? '',

    categoryState: json["category_state"]?.toString() ?? '',
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_state": categoryState,
  };

  Listado copy() => Listado(
    categoryId: categoryId,
    categoryName: categoryName,
    categoryState: categoryState,
  );
}
