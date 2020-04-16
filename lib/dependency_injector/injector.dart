import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/dependency_injector/type_factory.dart';
import 'package:flutter_deriv_api/dependency_injector/injector_exception.dart';

const String _defaultKey = 'default';

/// Injector class
class Injector {
  Injector._internal({this.name});

  /// Get the instance of the named injector
  // ignore: prefer_constructors_over_static_methods
  static Injector getInjector({String name = _defaultKey}) =>
      _injectors[name] = _injectors[name] ?? Injector._internal(name: name);

  static final Map<String, Injector> _injectors = <String, Injector>{};

  final Map<String, TypeFactory<Object>> _factories =
      <String, TypeFactory<Object>>{};

  /// The name of this injector
  final String name;

  /// Maps the given type to the given factory function
  void map<T>({
    @required ObjectFactoryFunction<T> factoryFunction,
    String key = _defaultKey,
    bool isSingleton = false,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_factories.containsKey(objectKey)) {
      throw InjectorException(
        message: "mapping already present for type '$objectKey'",
      );
    }

    _factories[objectKey] = TypeFactory<T>(
      factoryFunction: (Injector injector, Map<String, dynamic> parameters) =>
          factoryFunction(injector),
      isSingleton: isSingleton,
    );
  }

  /// Gets mapped instances of the given type
  void mapWithParams<T>({
    @required ObjectFactoryWithParametersFunction<T> factoryFunction,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_factories.containsKey(objectKey)) {
      throw InjectorException(
        message: "mapping already present for type '$objectKey'",
      );
    }

    _factories[objectKey] = TypeFactory<T>(
      factoryFunction: factoryFunction,
      isSingleton: false,
    );
  }

  /// Gets mapped instances of the given type and additional parameters
  T get<T>({
    String key = _defaultKey,
    Map<String, dynamic> additionalParameters,
  }) {
    final String objectKey = _generateKey(type: T, key: key);
    final TypeFactory<Object> objectFactory = _factories[objectKey];

    if (objectFactory == null) {
      throw InjectorException(
        message: "cannot find object factory for '$objectKey'",
      );
    }

    return objectFactory.get(this, additionalParameters);
  }

  /// Gets all the mapped instances of the given type and additional parameters
  Iterable<T> getAll<T>({Map<String, dynamic> additionalParameters}) {
    final List<T> instances = <T>[];
    final String keyForType =
        _generateKey(type: T).replaceFirst(_defaultKey, '');

    _factories.forEach((String key, TypeFactory<Object> typeFactory) {
      if (key.contains(keyForType)) {
        instances.add(typeFactory.get(this, additionalParameters));
      }
    });

    return instances;
  }

  /// Disposes of the injector instance and removes it from the named collection of injectors
  void dispose() {
    _factories.clear();
    _injectors.remove(name);
  }

  String _generateKey<T>({T type, String key = _defaultKey}) =>
      '${type.toString()}::$key';
}
