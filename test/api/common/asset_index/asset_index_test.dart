import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/asset_index_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/asset_index_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Asset Index Test', () async {
    final AssetIndexResponse assetIndices =
        await AssetIndexResponse.fetchAssetIndices(
            const AssetIndexRequest(landingCompany: 'svg'));

    expect(assetIndices.assetIndex?.length, 1);
    // expect(assetIndices.assetIndex.first['symbol_code'], 'frxAUDJPY');

    // final List<IndexContractModel> contracts = assetIndices.assetIndex.first['contracts'];

    // expect(contracts.length, 6);
    // expect(contracts.first.contractTypeCode, 'callput');
    // expect(contracts.first.contractTypeName, 'Rise/Fall');
    // expect(contracts.first.minDuration, '5t');
    // expect(contracts.first.maxDuration, '365d');
  });
}
