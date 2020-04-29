import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/landing_company/landing_company.dart';
import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'landing_company_mock_data.dart';

void main() {
  test('Landing company details test', () {
    final Map<String, dynamic> landingCompanyMap =
        jsonDecode(landingCompanyJSON);
    final LandingCompany landingCompany =
        LandingCompany.fromJson(landingCompanyMap['landing_company']);

    expect(landingCompany.config.taxDetailsRequired, true);
    expect(landingCompany.minimumAge, 18);
    expect(landingCompany.name, 'Indonesia');
    expect(landingCompany.id, 'id');
    expect(landingCompany.virtualCompany, 'virtual');

    final LandingCompanyDetailModel financialCompany =
        landingCompany.financialCompany;

    expect(financialCompany.hasRealityCheck, false);
    expect(financialCompany.marketsCurrencies.length, 2);
    expect(financialCompany.legalAllowedContractCategories.length, 12);
    expect(financialCompany.legalDefaultCurrency, 'AUD');
    expect(financialCompany.country, 'Saint Vincent and the Grenadines');
    expect(financialCompany.legalDefaultCurrency, 'AUD');
    expect(financialCompany.shortcode, 'svg');
    expect(financialCompany.legalAllowedMarkets.length, 2);
    expect(financialCompany.legalAllowedMarkets.first, 'commodities');

    final LandingCompanyDetailModel mtFinancialAdvanced =
        landingCompany.mtFinancialCompany.advanced;

    expect(mtFinancialAdvanced.address.length, 4);

    expect(mtFinancialAdvanced.hasRealityCheck, false);
    expect(mtFinancialAdvanced.marketsCurrencies.length, 1);
    expect(mtFinancialAdvanced.legalAllowedContractCategories.length, 1);
    expect(mtFinancialAdvanced.legalDefaultCurrency, 'AUD');
    expect(mtFinancialAdvanced.country, 'Malaysia');
    expect(mtFinancialAdvanced.shortcode, 'labuan');
    expect(mtFinancialAdvanced.legalAllowedMarkets.length, 1);
    expect(mtFinancialAdvanced.legalAllowedMarkets.first, 'forex');
  });
}
