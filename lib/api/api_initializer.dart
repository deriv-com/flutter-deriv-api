import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// API initializer class
class APIInitializer {
  /// Initialize injector
  Injector initialize({
    bool isMock = false,
    UniqueKey uniqueKey,
  }) {
    final UniqueKey apiUniqueKey = uniqueKey ?? UniqueKey();
    return Injector.getInjector()
      ..map<BaseAPI>(
        factoryFunction: (Injector injector) =>
            isMock ? MockAPI(apiUniqueKey) : BinaryAPI(apiUniqueKey),
        isSingleton: true,
      );
  }
}
