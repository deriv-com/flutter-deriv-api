import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/states/state.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('State list JSON parsing', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final List<State> states = await State.fetchStatesList(
      const StatesListRequest(),
    );

    expect(states.first.text, 'Aceh');
    expect(states.first.value, 'AC');
  });
}
