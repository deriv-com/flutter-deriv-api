import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'injector.dart';

/// Module Container
class ModuleContainer {
  /// Initialize injector
  Injector initialize(Injector injector) {
    injector.map<BasicBinaryAPI>(
      factoryFunction: (Injector injector) => BasicBinaryAPI(),
      isSingleton: true,
    );

    return injector;
  }
}
