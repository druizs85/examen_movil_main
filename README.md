# Sistema de Gestión - Flutter

Aplicación desarrollada en Flutter para la gestión de Productos, Categorías y Proveedores, utilizando consumo de API REST, Provider para manejo de estado y navegación mediante rutas.

---

# Funcionalidades

## Login
- Inicio de sesión de acceso.
- Navegación hacia el menú principal.

## Vista de Inicio
- Acceso rápido a:
  - Módulo de Productos
  - Módulo de Categorías
  - Módulo de Proveedores

---

# Módulo de Productos

- Listar productos
- Ver detalle de producto
- Editar producto
- Eliminar producto

## Endpoints utilizados

- `ejemplos/product_list_rest/`
- `ejemplos/product_add_rest/`
- `ejemplos/product_edit_rest/`
- `ejemplos/product_del_rest/`

---

# Módulo de Categorías

- Listar categorías
- Ver detalle de categoría
- Editar categoría
- Eliminar categoría

## Endpoints utilizados

- `ejemplos/category_list_rest/`
- `ejemplos/category_add_rest/`
- `ejemplos/category_edit_rest/`
- `ejemplos/category_del_rest/`

---

# Módulo de Proveedores

- Listar proveedores
- Ver detalle de proveedor
- Editar proveedor
- Eliminar proveedor

## Endpoints utilizados

- `ejemplos/provider_list_rest/`
- `ejemplos/provider_add_rest/`
- `ejemplos/provider_edit_rest/`
- `ejemplos/provider_del_rest/`

---

# Tecnologías utilizadas

- Flutter
- Dart
- Provider
- HTTP Package
- API REST
- Material Design

---

# Arquitectura utilizada

El proyecto se encuentra organizado mediante:

```text
lib/
│
├── models/
├── providers/
├── routes/
├── screens/
├── services/
├── themes/
└── widgets/
```

---

# Manejo de estado

Se utilizó `Provider` para:

- Manejo de formularios
- Gestión de servicios
- Actualización de interfaces

---

# Ejecución del proyecto

## Instalar dependencias

```bash
flutter pub get
```

## Ejecutar proyecto

```bash
flutter run
```

---

# Autor

**Daniel Ruiz Saez**  
Ingeniería en Informática