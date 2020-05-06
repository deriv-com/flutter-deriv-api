import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/states/state.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'state_mock_data.dart';

void main() {
  test('State list JSON parsing', () {
    final Map<String, dynamic> statesListMap = jsonDecode(statesListJSON);
    final List<State> states = getListFromMap(
      statesListMap['states_list'],
      itemToTypeCallback: (dynamic item) => State.fromJson(item),
    );

    expect(states.first.text, 'Aceh');
    expect(states.first.value, 'AC');
  });
}
