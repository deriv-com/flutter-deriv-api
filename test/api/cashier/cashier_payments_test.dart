import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/cashier_payments_response_extended.dart';
import 'package:flutter_deriv_api/api/response/cashier_payments_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_payments_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Cashier Payments Test', () async {
    final CashierPaymentsResponse response =
        await CashierPaymentsResponseExtended.fetchCashierPayments(
      request: const CashierPaymentsRequest(),
    );

    expect(response.cashierPayments?.crypto?.length, 1);
    expect(response.cashierPayments?.crypto?.first.id, 'id');
    expect(response.cashierPayments?.crypto?.first.statusCode,
        StatusCodeEnum.cancelled);
    expect(
      response
          .cashierPayments?.crypto?.first.submitDate?.millisecondsSinceEpoch,
      1695118224000,
    );
  });
}
