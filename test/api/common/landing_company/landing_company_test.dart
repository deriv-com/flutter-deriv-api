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
        const LandingCompanyRequest(landingCompany: 'CountryCode'),
      );

      // expect(landingCompany.config.taxDetailsRequired, true);
      // expect(landingCompany.landingCompany.financialCompany..minimumAge, 18);
      // expect(landingCompany.name, 'Indonesia');
      // expect(landingCompany.id, 'id');
      // expect(landingCompany.virtualCompany, 'virtual');

      final FinancialCompany financialCompany =
          landingCompany.landingCompany!.financialCompany!;

      expect(financialCompany.hasRealityCheck, 0);
      expect(financialCompany.legalDefaultCurrency?.length, 3);
      expect(financialCompany.legalAllowedContractCategories?.length, 13);
      expect(financialCompany.legalDefaultCurrency, 'USD');
      expect(financialCompany.country, 'Saint Vincent and the Grenadines');
      expect(financialCompany.legalDefaultCurrency, 'USD');
      expect(financialCompany.shortcode, 'svg');
      expect(financialCompany.legalAllowedMarkets?.length, 4);
      expect(financialCompany.legalAllowedMarkets?.first, 'commodities');

      final Financial mtFinancialAdvanced =
          landingCompany.landingCompany!.mtFinancialCompany!.financial!;

      //  expect(mtFinancialAdvanced.address.length, 4);

      expect(mtFinancialAdvanced.hasRealityCheck, false);
      expect(mtFinancialAdvanced.legalAllowedCurrencies?.length, 9);
      expect(mtFinancialAdvanced.legalAllowedContractCategories?.length, 13);
      expect(mtFinancialAdvanced.legalDefaultCurrency, 'USD');
      expect(mtFinancialAdvanced.country, 'Saint Vincent and the Grenadines');
      expect(mtFinancialAdvanced.shortcode, 'svg');
      expect(mtFinancialAdvanced.legalAllowedMarkets?.length, 4);
      expect(mtFinancialAdvanced.legalAllowedMarkets?.first, 'commodities');
    });

    test('Fetch Landing Company Details Test', () async {
      final LandingCompanyDetailsResponse landingCompanyDetail =
          await LandingCompanyResponse.fetchLandingCompanyDetails(
        const LandingCompanyDetailsRequest(landingCompanyDetails: 'LC Code'),
      );

      expect(landingCompanyDetail.landingCompanyDetails?.address?.length, 4);
      expect(landingCompanyDetail.landingCompanyDetails?.country,
          'Sample country');
      expect(landingCompanyDetail.landingCompanyDetails?.legalDefaultCurrency,
          'BTC');
      expect(
          landingCompanyDetail
              .landingCompanyDetails?.legalAllowedCurrencies?.length,
          2);
      expect(
          landingCompanyDetail
              .landingCompanyDetails?.legalAllowedContractCategories?.length,
          4);
      expect(
          landingCompanyDetail
              .landingCompanyDetails?.legalAllowedMarkets?.length,
          2);

      // final List<LandingCompanyFieldsInfoModel> changeableFields =
      //     landingCompanyDetail.landingCompanyDetails.changeableFields;

      // expect(changeableFields.length, 1);
      // expect(changeableFields.first.fields.length, 6);
      // expect(changeableFields.first.fields.first, 'salutation');
    });
  });
}
