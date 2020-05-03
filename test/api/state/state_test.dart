import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/states/state.dart';
import 'states_list_mock_data.dart';

void main() {
  test('State list JSON parsing', () {
    final Map<String, dynamic> statesListMap = jsonDecode(statesListJSON);
    final List<State> states = statesListMap['states_list']
        .map<State>((dynamic item) => State.fromJson(item))
        .toList();

    expect(states.first.text, 'Aceh');
    expect(states.first.value, 'AC');
  });
}
