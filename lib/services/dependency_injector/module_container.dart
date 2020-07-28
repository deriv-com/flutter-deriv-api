import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Module Container
class ModuleContainer {
  /// Initialize injector
  Injector initialize(
    Injector injector, {
    bool isMock = false,
    UniqueKey uniqueKey,
  }) {
    injector.map<BaseAPI>(
      factoryFunction: (Injector injector) =>
          isMock ? MockAPI(uniqueKey) : BinaryAPI(uniqueKey),
      isSingleton: true,
    );

    return injector;
  }
}
