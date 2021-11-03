import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/profit_table_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/profit_table_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Profit Table Test', () async {
    final ProfitTableResponse profitTable = await ProfitTableResponse.fetch(
      const ProfitTableRequest(
        contractType: <String>[],
        description: true,
        limit: 25,
        offset: 25,
        sort: 'ASC',
      ),
    );

    expect(profitTable.profitTable?.count, 2);

    expect(profitTable.profitTable?.transactions?.length, 2);

    final TransactionsItem? transaction =
        profitTable.profitTable?.transactions?.first;

    expect(transaction?.appId, 1234);
    expect(transaction?.buyPrice, 250.0);
    expect(transaction?.contractId, 4867502908);
    expect(
      transaction?.longcode,
      'Win 50% of your stake for every 1% fall in USD/JPY.',
    );
    expect(transaction?.payout, 10.0);
    expect(transaction?.purchaseTime, getDateTime(1587544006));
    expect(transaction?.sellPrice, 5.25);
    expect(transaction?.sellTime, getDateTime(1587554006));
    expect(
      transaction?.shortcode,
      'MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00',
    );
    expect(transaction?.transactionId, 10867502908);
  });
}
