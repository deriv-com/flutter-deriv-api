import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/landing_company/landing_company.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_fields_info_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('Landing company test', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('Landing company test', () async {
      final LandingCompany landingCompany =
          await LandingCompany.fetchLandingCompanies(
              const LandingCompanyRequest(landingCompany: 'CountryCode'));

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
      expect(financialCompany.shortCode, 'svg');
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
      expect(mtFinancialAdvanced.shortCode, 'labuan');
      expect(mtFinancialAdvanced.legalAllowedMarkets.length, 1);
      expect(mtFinancialAdvanced.legalAllowedMarkets.first, 'forex');
    });

    test('Landing company details test', () async {
      final LandingCompanyDetailModel landingCompanyDetail =
          await LandingCompany.fetchLandingCompanyDetails(
        const LandingCompanyDetailsRequest(landingCompanyDetails: 'LC Code'),
      );

      expect(landingCompanyDetail.address.length, 4);
      expect(landingCompanyDetail.country, 'Sample country');
      expect(landingCompanyDetail.legalDefaultCurrency, 'BTC');
      expect(landingCompanyDetail.legalAllowedCurrencies.length, 2);
      expect(landingCompanyDetail.legalAllowedContractCategories.length, 4);
      expect(landingCompanyDetail.legalAllowedMarkets.length, 2);

      final List<LandingCompanyFieldsInfoModel> changeableFields =
          landingCompanyDetail.changeableFields;
      expect(changeableFields.length, 1);
      expect(changeableFields.first.fields.length, 6);
      expect(changeableFields.first.fields.first, 'salutation');
    });
  });
}
