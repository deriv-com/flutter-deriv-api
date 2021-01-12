import 'package:flutter_deriv_api/basic_api/generated/landing_company_details_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/landing_company_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/landing_company_details_receive_result.dart';
import 'package:flutter_deriv_api/api/response/landing_company_receive_result.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Landing Company Group ->', () {
    test('Fetch Landing Companies Test', () async {
      final LandingCompanyResponse landingCompany =
          await LandingCompanyResponse.fetchLandingCompanies(
        const LandingCompanySend(landingCompany: 'CountryCode'),
      );

      //expect(landingCompany.config.taxDetailsRequired, true);
      // expect(landingCompany.landingCompany.financialCompany..minimumAge, 18);
      // expect(landingCompany.name, 'Indonesia');
      // expect(landingCompany.id, 'id');
      // expect(landingCompany.virtualCompany, 'virtual');

      final FinancialCompany financialCompany =
          landingCompany.landingCompany.financialCompany;

      expect(financialCompany.hasRealityCheck, false);
      expect(financialCompany.legalDefaultCurrency.length, 2);
      expect(financialCompany.legalAllowedContractCategories.length, 12);
      expect(financialCompany.legalDefaultCurrency, 'AUD');
      expect(financialCompany.country, 'Saint Vincent and the Grenadines');
      expect(financialCompany.legalDefaultCurrency, 'AUD');
      expect(financialCompany.shortcode, 'svg');
      expect(financialCompany.legalAllowedMarkets.length, 2);
      expect(financialCompany.legalAllowedMarkets.first, 'commodities');

      final Financial mtFinancialAdvanced =
          landingCompany.landingCompany.mtFinancialCompany.financial;

      expect(mtFinancialAdvanced.address.length, 4);

      expect(mtFinancialAdvanced.hasRealityCheck, false);
      expect(mtFinancialAdvanced.legalAllowedCurrencies.length, 1);
      expect(mtFinancialAdvanced.legalAllowedContractCategories.length, 1);
      expect(mtFinancialAdvanced.legalDefaultCurrency, 'AUD');
      expect(mtFinancialAdvanced.country, 'Malaysia');
      expect(mtFinancialAdvanced.shortcode, 'labuan');
      expect(mtFinancialAdvanced.legalAllowedMarkets.length, 1);
      expect(mtFinancialAdvanced.legalAllowedMarkets.first, 'forex');
    });

    test('Fetch Landing Company Details Test', () async {
      final LandingCompanyDetailsResponse landingCompanyDetail =
          await LandingCompanyResponse.fetchLandingCompanyDetails(
        const LandingCompanyDetailsSend(landingCompanyDetails: 'LC Code'),
      );

      expect(landingCompanyDetail.landingCompanyDetails.address.length, 4);
      expect(landingCompanyDetail.landingCompanyDetails.country, 'Sample country');
      expect(landingCompanyDetail.landingCompanyDetails.legalDefaultCurrency, 'BTC');
      expect(landingCompanyDetail.landingCompanyDetails.legalAllowedCurrencies.length, 2);
      expect(landingCompanyDetail.landingCompanyDetails.legalAllowedContractCategories.length, 4);
      expect(landingCompanyDetail.landingCompanyDetails.legalAllowedMarkets.length, 2);

      // final List<LandingCompanyFieldsInfoModel> changeableFields =
      //     landingCompanyDetail.landingCompanyDetails.changeableFields;

      // expect(changeableFields.length, 1);
      // expect(changeableFields.first.fields.length, 6);
      // expect(changeableFields.first.fields.first, 'salutation');
    });
  });
}
