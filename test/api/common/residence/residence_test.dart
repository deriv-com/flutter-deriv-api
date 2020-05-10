import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/residence/residence.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Residence list JSON parsing', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final List<Residence> residenceList = await Residence.fetchResidenceList(
      const ResidenceListRequest(),
    );

    expect(residenceList.first.countryName, 'SampleCountry');
    expect(residenceList.first.countryCode, 'sc');
    expect(residenceList.first.phoneIdd, '00');
    expect(residenceList.length, 1);
  });
}
