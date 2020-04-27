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

    expect(residenceList.first.countryName, 'SampleCountry');
    expect(residenceList.first.countryCode, 'sc');
    expect(residenceList.first.phoneIdd, '00');
    expect(residenceList.length, 1);
  });
}
