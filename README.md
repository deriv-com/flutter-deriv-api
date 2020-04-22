# flutter-deriv-api

Flutter/Dart API for **binary.com** websockets API.

---

##### Json Schema Parser Utility

`JsonSchemaParser` class is a utility for extracting main and nested classes from model schema contents. for using this utility:

- call `getModel(...)` method and pass decoded schema as `Map<String, dynamic> schema`.
- pass the result as `models` parameter to `getClasses(...)` method.

final result is a `string` that contains main class and all related classes of that schema file including:

- model classes
- constructors
- properties
- toJson method
- fromJson method
- copyWith method

---
