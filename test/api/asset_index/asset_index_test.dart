import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/asset_index/asset_index.dart';
import 'package:flutter_deriv_api/api/models/index_contract_model.dart';
import 'asset_index_mock_data.dart';

void main() {
  test('Asset index JSON parsing', () {
    final Map<String, dynamic> assetIndexMap = jsonDecode(assetIndexJSON);
    final List<AssetIndex> assetIndices = assetIndexMap['asset_index']
        .map<AssetIndex>((dynamic item) => AssetIndex.fromJson(item))
        .toList();

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
