import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/residence/residence.dart';

import 'residence_list_mock_data.dart';

void main() {
  test('Residence list JSON parsing', () {
    final Map<String, dynamic> residenceListMap = jsonDecode(residenceListJSON);
    final List<Residence> residenceList = residenceListMap['residence_list']
        .map<Residence>((dynamic entry) => Residence.fromJson(entry))
        .toList();

    expect(residenceList.first.countryName, 'Afghanistan');
    expect(residenceList.first.countryCode, 'af');
    expect(residenceList.first.phoneIdd, '93');
  });
}
