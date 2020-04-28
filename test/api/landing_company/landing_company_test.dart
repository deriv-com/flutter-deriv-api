import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/landing_company/landing_company.dart';
import 'landing_company_mock_data.dart';

void main() {
  test('Landing company details test', () {
    final Map<String, dynamic> landingCompanyMap =
        jsonDecode(landingCompanyJSON);
    final LandingCompany landingCompany =
        LandingCompany.fromJson(landingCompanyMap['landing_company']);

    print('object');
  });
}
