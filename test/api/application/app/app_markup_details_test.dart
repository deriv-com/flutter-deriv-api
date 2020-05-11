import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  test('app markup details test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppMarkupDetails appMarkupDetails =
        await AppMarkupDetails.fetchApplicationMarkupDetails(
      request: const AppMarkupDetailsRequest(
        appId: 1234,
        appMarkupDetails: 1,
        clientLoginid: 'CR12345',
        dateFrom: '2017-08-01 00:00:00',
        dateTo: '2017-08-31 23:59:59',
        description: 1,
        limit: 100,
        offset: 0,
        passthrough: <String, dynamic>{},
        reqId: 3,
        sort: 'ASC',
      ),
    );

    expect(appMarkupDetails.transactions.length, 1);

    expect(appMarkupDetails.transactions.first.appId, 1234);
    expect(appMarkupDetails.transactions.first.appMarkup, 15.0);
    expect(appMarkupDetails.transactions.first.appMarkupUsd, 25.0);
    expect(appMarkupDetails.transactions.first.appMarkupValue, 12.0);
    expect(appMarkupDetails.transactions.first.clientCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions.first.clientLoginId, 'CR12345');
    expect(appMarkupDetails.transactions.first.devCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions.first.devLoginId, 'CR45627');
    expect(appMarkupDetails.transactions.first.transactionId, 10867502908);
    expect(
      appMarkupDetails.transactions.first.transactionTime,
      getDateTime(1587544006),
    );
  });
}
