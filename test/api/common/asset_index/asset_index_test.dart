import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/asset_index/asset_index.dart';
import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUp(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  test('Fetch Asset Index Test', () async {
    final List<AssetIndex> assetIndices = await AssetIndex.fetchAssetIndices();

    expect(assetIndices.length, 1);
    expect(assetIndices.first.symbolName, 'AUD/JPY');
    expect(assetIndices.first.symbolCode, 'frxAUDJPY');

    final List<IndexContractModel> contracts = assetIndices.first.contracts;

    expect(contracts.length, 6);
    expect(contracts.first.contractTypeCode, 'callput');
    expect(contracts.first.contractTypeName, 'Rise/Fall');
    expect(contracts.first.minDuration, '5t');
    expect(contracts.first.maxDuration, '365d');
  });
}
