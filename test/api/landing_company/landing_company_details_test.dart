import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'landing_company_detail_mock_data.dart';

void main() {
  test('Landing company details test', () {
    final Map<String, dynamic> landingCompanyDetailsMap =
        jsonDecode(landingCompanyDetailJSON);
    final LandingCompanyDetailModel landingCompanyDetailModel =
        LandingCompanyDetailModel.fromJson(
            landingCompanyDetailsMap['landing_company_details']);

    expect(landingCompanyDetailModel.address.length, 4);
    expect(landingCompanyDetailModel.country, 'Sample country');
    expect(landingCompanyDetailModel.legalDefaultCurrency, 'BTC');
    expect(landingCompanyDetailModel.legalAllowedCurrencies.length, 2);
    expect(landingCompanyDetailModel.legalAllowedContractCategories.length, 4);
    expect(landingCompanyDetailModel.legalAllowedMarkets.length, 2);
  });
}