import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Injector Test', () {
    final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

    expect(_api is MockAPI, true);
  });
}
