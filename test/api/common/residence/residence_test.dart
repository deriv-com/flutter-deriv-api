import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/residence_list_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Residence List Test', () async {
    // Fetch the residence list
    final ResidenceListResponse residenceList =
        await ResidenceListResponse.fetchResidenceList();

    // Check the overall structure of the response
    expect(residenceList, isNotNull);
    expect(residenceList.residenceList, isNotNull);
    expect(residenceList.residenceList?.length, 1);

    // Get the first (and only) residence item
    final ResidenceListItem residence = residenceList.residenceList!.first;

    // Check basic properties
    expect(residence.phoneIdd, '35818');
    expect(residence.text, 'Aland Islands');
    expect(residence.value, 'ax');
    expect(residence.disabled, 'DISABLED');

    // Check common reporting standard properties
    expect(residence.commonReportingStandard, isNotNull);
    expect(residence.commonReportingStandard?.nonParticipatingJurisdictions,
        isNotNull);
    expect(
        residence.commonReportingStandard?.nonParticipatingJurisdictions
            ?.nonParticipatingJurisdictionsDefault,
        isFalse);
    expect(
        residence.commonReportingStandard?.nonParticipatingJurisdictions
            ?.landingCompany,
        isNotNull);
    expect(
        residence.commonReportingStandard?.nonParticipatingJurisdictions
            ?.landingCompany?['bvi'],
        isTrue);
    expect(
        residence.commonReportingStandard?.nonParticipatingJurisdictions
            ?.landingCompany?['labuan'],
        isTrue);
    expect(
        residence.commonReportingStandard?.nonParticipatingJurisdictions
            ?.landingCompany?['vanuatu'],
        isTrue);

    expect(residence.commonReportingStandard?.postcode, isNotNull);
    expect(residence.commonReportingStandard?.postcode?.invalidPattern, isNull);

    expect(residence.commonReportingStandard?.tax, isNotNull);
    expect(residence.commonReportingStandard?.tax?.mandatory, isFalse);
    expect(residence.commonReportingStandard?.tax?.poiEquivalent, isFalse);
    expect(residence.commonReportingStandard?.tax?.tinCleaner, '[.\-\/\s]');
    expect(residence.commonReportingStandard?.tax?.tinFormat,
        <String>['^[FfEe]-\d{6}-[A-Za-z]\$']);
    expect(
        residence.commonReportingStandard!.tax!.tinFormatDescription, isNull);

    // Check identity properties
    expect(residence.identity, isNotNull);
    expect(residence.identity?.services, isNotNull);
    expect(residence.identity?.services?.idv, isNotNull);
    expect(residence.identity?.services?.idv?.documentsSupported, isNotNull);
    expect(
        residence.identity?.services?.idv?.documentsSupported?.isEmpty, isTrue);
    expect(residence.identity?.services?.idv?.hasVisualSample, isFalse);
    expect(residence.identity?.services?.idv?.isCountrySupported, isFalse);

    expect(residence.identity?.services?.onfido, isNotNull);
    expect(residence.identity?.services?.onfido?.documentsSupported, isNotNull);
    expect(residence.identity?.services?.onfido?.documentsSupported?.length, 1);
    expect(
        residence
            .identity?.services?.onfido?.documentsSupported?['driving_licence'],
        isNotNull);
    expect(
        residence.identity?.services?.onfido
            ?.documentsSupported?['driving_licence']?.displayName,
        'Driving Licence');
    expect(residence.identity?.services?.onfido?.isCountrySupported, isFalse);

    // Check jurisdiction risk assessment properties
    expect(residence.jurisdictionRiskAssessment, isNotNull);
    expect(residence.jurisdictionRiskAssessment?.disclaimer, isNotNull);
    expect(residence.jurisdictionRiskAssessment?.disclaimer?.accept, isFalse);
    expect(residence.jurisdictionRiskAssessment?.disclaimer?.message, '');

    expect(residence.jurisdictionRiskAssessment?.riskLevel, isNotNull);
    expect(residence.jurisdictionRiskAssessment?.riskLevel?.riskLevelDefault,
        'low');
    expect(residence.jurisdictionRiskAssessment?.riskLevel?.landingCompany,
        isNotNull);
    expect(
        residence.jurisdictionRiskAssessment?.riskLevel?.landingCompany?['bvi'],
        'low');
    expect(
        residence
            .jurisdictionRiskAssessment?.riskLevel?.landingCompany?['labuan'],
        'low');
    expect(
        residence
            .jurisdictionRiskAssessment?.riskLevel?.landingCompany?['vanuatu'],
        'standard');

    expect(residence.jurisdictionRiskAssessment?.turnover, isNotNull);
    expect(residence.jurisdictionRiskAssessment?.turnover?.maxLimit, isFalse);

    // Check additional properties
    expect(residence.walletSignup, isFalse);
    expect(residence.partnerSignup, isFalse);
    expect(residence.accountOpeningSelfDeclarationRequired, isFalse);

    // Check the JSON conversion
    final Map<String, dynamic> json =
        residence.copyWith(walletSignup: true).toJson();

    expect(json['wallet_signup'], 1);

    // Check the object creation from JSON
    final ResidenceListItem residenceFromJson =
        ResidenceListItem.fromJson(json);
    expect(residenceFromJson.walletSignup, isTrue);
  });
}
