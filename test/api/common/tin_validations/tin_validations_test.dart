import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/tin_validations_response_extended.dart';
import 'package:flutter_deriv_api/api/response/tin_validations_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/tin_validations_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Get TIN validations test', () async {
    final TinValidationsResponse tinValidationsResponse =
        await TinValidationsResponseExtended.getTINValidations(
      request: const TinValidationsRequest(taxResidence: 'ke'),
    );

    expect(tinValidationsResponse.tinValidations?.isTinMandatory, isFalse);
    expect(
        tinValidationsResponse
            .tinValidations?.tinEmploymentStatusBypass?.isEmpty,
        isTrue);
    expect(tinValidationsResponse.tinValidations?.tinFormat?.first,
        '^[A-Z]\d{9}[A-Z]\$');
    if (tinValidationsResponse.tinValidations?.invalidPatterns != null) {
      expect(tinValidationsResponse.tinValidations?.invalidPatterns?.first,
          '^(\d)\1*[a-zA-Z]?\$');
      expect(tinValidationsResponse.tinValidations?.invalidPatterns?.last,
          '^(0?9?8?7?6?5?4?3?2?1?0?)[a-zA-Z]?\$');
    }
  });
}
