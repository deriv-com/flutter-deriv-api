import 'package:flutter/material.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// API initializer class
class APIInitializer {
  /// Initialize injector
  Injector initialize({UniqueKey? uniqueKey, BaseAPI? api}) =>
      Injector.getInjector()
        ..map<BaseAPI>(
          factoryFunction: (_) =>
              api ?? BinaryAPI(uniqueKey: uniqueKey ?? UniqueKey()),
          isSingleton: true,
        );
}
