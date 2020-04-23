import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/states_list/states_list.dart';
import 'states_list_mock_data.dart';

void main() {
  test('State list JSON parsing', () {
    final StatesList statesList =
        StatesList.fromJson(jsonDecode(statesListJSON));

    expect(statesList.states.first.text, 'Aceh');
    expect(statesList.states.first.value, 'AC');
  });
}
