import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/states/state.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch States Test', () async {
    final List<State?>? states = await State.fetchStatesList(
      const StatesListRequest(statesList: 'code'),
    );

    expect(states!.first!.text, 'Aceh');
    expect(states.first!.value, 'AC');
  });
}
