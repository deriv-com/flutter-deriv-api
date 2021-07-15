import 'package:flutter_deriv_api/basic_api/generated/states_list_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/states_list_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch States Test', () async {
    final StatesListResponse states = await StatesListResponse.fetchStatesList(
      const StatesListRequest(statesList: 'code'),
    );

    expect(states.statesList!.first.text, 'Aceh');
    expect(states.statesList!.first.value, 'AC');
  });
}
