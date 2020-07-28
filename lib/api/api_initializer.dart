import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// API initializer class
class APIInitializer {
  /// Initialize injector
  Injector initialize([bool isMock = false]) => Injector.getInjector()
    ..map<BaseAPI>(
      factoryFunction: (Injector injector) => isMock ? MockAPI() : BinaryAPI(),
      isSingleton: true,
    );
}
