import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Object factory function type.
typedef ObjectFactoryFunction<T> = T Function(Injector injector);

/// Object factory with parameters function type.
typedef ObjectFactoryWithParametersFunction<T> = T Function(
  Injector injector,
  Map<String, dynamic> additionalParameters,
);

/// Type factory class
class TypeFactory<T> {
  /// Initializes
  TypeFactory({
    ObjectFactoryWithParametersFunction<T> factoryFunction,
    bool isSingleton,
  })  : _factoryFunction = factoryFunction,
        _isSingleton = isSingleton;

  T _instance;

  final bool _isSingleton;
  final ObjectFactoryWithParametersFunction<T> _factoryFunction;

  /// Get type instance
  T get(Injector injector, Map<String, dynamic> additionalParameters) {
    if (_isSingleton && _instance != null) {
      return _instance;
    }

    final T instance = _factoryFunction(injector, additionalParameters);

    if (_isSingleton) {
      _instance = instance;
    }

    return instance;
  }
}
