import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/states/state.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch States Test', () async {
    final List<State?>? states = await State.fetchStatesList(
      const StatesListRequest(statesList: 'code'),
    );

    final State firstState = states!.first!;

    expect(firstState.text, 'Aceh');
    expect(firstState.value, 'AC');
  });
}
