import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/asset_index/asset_index.dart';
import 'package:flutter_deriv_api/api/common/models/index_contract_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'asset_index_mock_data.dart';

void main() {
  test('Asset index JSON parsing', () {
    final Map<String, dynamic> assetIndexMap = jsonDecode(assetIndexJSON);
    final List<AssetIndex> assetIndices = getListFromMap(
      assetIndexMap['asset_index'],
      itemToTypeCallback: (dynamic item) => AssetIndex.fromJson(item),
    );

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
