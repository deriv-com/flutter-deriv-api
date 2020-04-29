import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/models/landing_company_fields_info_model.dart';

import 'landing_company_detail_mock_data.dart';

void main() {
  test('Landing company details test', () {
    final Map<String, dynamic> landingCompanyDetailsMap =
        jsonDecode(landingCompanyDetailJSON);
    final LandingCompanyDetailModel landingCompanyDetail =
        LandingCompanyDetailModel.fromJson(
            landingCompanyDetailsMap['landing_company_details']);

    expect(landingCompanyDetail.address.length, 4);
    expect(landingCompanyDetail.country, 'Sample country');
    expect(landingCompanyDetail.legalDefaultCurrency, 'BTC');
    expect(landingCompanyDetail.legalAllowedCurrencies.length, 2);
    expect(landingCompanyDetail.legalAllowedContractCategories.length, 4);
    expect(landingCompanyDetail.legalAllowedMarkets.length, 2);

    final List<LandingCompanyFieldsInfoModel> requirements =
        landingCompanyDetail.requirements;

    expect(requirements.length, 2);
    expect(requirements.first.fields.length, 4);
    expect(requirements.first.fields.first, 'first_name');

    final List<LandingCompanyFieldsInfoModel> changeableFields =
        landingCompanyDetail.changeableFields;
    expect(changeableFields.length, 1);
    expect(changeableFields.first.fields.length, 6);
    expect(changeableFields.first.fields.first, 'salutation');
  });
}
