import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// API initializer class
class APIInitializer {
  /// Initialize injector
  Injector initialize({required BaseAPI api}) => Injector()
    ..register<BaseAPI>(
      factoryFunction: (_) => api,
      isSingleton: true,
    );
}
