import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/application/app/application.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_markup_details_send.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  test('app markup details', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppMarkupDetails appMarkupDetails =
        await Application.fetchApplicationMarkupDetails(
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

    expect(appMarkupDetails.transactions[0].appId, 1234);
    expect(appMarkupDetails.transactions[0].appMarkup, 15.0);
    expect(appMarkupDetails.transactions[0].appMarkupUsd, 25.0);
    expect(appMarkupDetails.transactions[0].appMarkupValue, 12.0);
    expect(appMarkupDetails.transactions[0].clientCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions[0].clientLoginId, 'CR12345');
    expect(appMarkupDetails.transactions[0].devCurrencyCode, 'USD');
    expect(appMarkupDetails.transactions[0].devLoginId, 'CR45627');
    expect(appMarkupDetails.transactions[0].transactionId, 10867502908);
    expect(
      appMarkupDetails.transactions[0].transactionTime,
      getDateTime(1587544006),
    );
  });
}
