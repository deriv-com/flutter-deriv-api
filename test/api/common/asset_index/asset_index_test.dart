import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/asset_index/asset_index.dart';
import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Asset Index Test', () async {
    final List<AssetIndex?>? assetIndices =
        await AssetIndex.fetchAssetIndices();
    final AssetIndex firstAssetIndex = assetIndices!.first!;

    expect(assetIndices.length, 1);
    expect(firstAssetIndex.symbolName, 'AUD/JPY');
    expect(firstAssetIndex.symbolCode, 'frxAUDJPY');

    final List<IndexContractModel?> contracts = assetIndices.first!.contracts!;
    final IndexContractModel firstContracts = contracts.first!;

    expect(contracts.length, 6);
    expect(firstContracts.contractTypeCode, 'callput');
    expect(firstContracts.contractTypeName, 'Rise/Fall');
    expect(firstContracts.minDuration, '5t');
    expect(firstContracts.maxDuration, '365d');
  });
}
