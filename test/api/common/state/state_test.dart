import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/states_list_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/states_list_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch States Test', () async {
    final StatesListResponse states = await StatesListResponse.fetchStatesList(
      const StatesListRequest(statesList: 'code'),
    );

    expect(states.statesList!.first.text, 'Aceh');
    expect(states.statesList!.first.value, 'AC');
  });
}
