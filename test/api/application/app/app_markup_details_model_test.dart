import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'app_markup_details_model_mock_data.dart';

void main() {
  test('app markup details json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(appMarkupDetailsModelMockData);
    final AppMarkupDetails appMarkupDetails =
        AppMarkupDetails.fromJson(mapData['app_markup_details']);

    expect(appMarkupDetails.transactions.length, 1);

    expect(appMarkupDetails.transactions[0].appId, 1234);
    expect(appMarkupDetails.transactions[0].appMarkup, 15.0);
    expect(appMarkupDetails.transactions[0].appMarkupUsd, 25.0);
    expect(appMarkupDetails.transactions[0].appMarkupValue, 12.0);
    expect(appMarkupDetails.transactions[0].clientCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions[0].clientLoginId, 'CR12345');
    expect(appMarkupDetails.transactions[0].devCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions[0].devLoginId, 'CR45627');
    expect(appMarkupDetails.transactions[0].transactionId, 10867502908);
    expect(appMarkupDetails.transactions[0].transactionTime,
        getDateTime(1587544006));
  });
}
