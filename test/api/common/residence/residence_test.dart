import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/residence_list_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Residence List Test', () async {
    final ResidenceListResponse residenceList =
        await ResidenceListResponse.fetchResidenceList();
    final ResidenceListItem residence = residenceList.residenceList!.first;
     expect(residence.phoneIdd, '00');
    // expect(residence.countryName, 'SampleCountry');
    // expect(residence.countryCode, 'sc');
    // expect(residence.disabled, 'DISABLED');
    // expect(residence.isDisabled, true);
    // expect(residence.isSelected, false);
    expect(residenceList.residenceList?.length, 1);
  });
}
