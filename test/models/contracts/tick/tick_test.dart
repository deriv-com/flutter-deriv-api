import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contarcts/tick/tick.dart';
import 'package:flutter_deriv_api/api/contarcts/tick/tick_history.dart';
import 'tick_history_mock_data.dart';
import 'tick_mock_data.dart';

void main() {
  test('Tick stream JSON parsing', () {
    final Map<String, dynamic> tickMap = jsonDecode(tickJSON);
    final Tick tick = Tick.fromJson(tickMap['tick']);

    expect(tick.ask, 218.1026);
    expect(tick.bid, 218.0826);
    expect(tick.id, 'b4d42748-0744-c46b-f59b-cb7dd936bafa');
    expect(tick.symbol, 'R_50');
  });

  test('TickHistory JSON parsing', () {
    final Map<String, dynamic> tickHistoryMap = jsonDecode(tickHistoryJSON);
    final TickHistory tickHistory = TickHistory.fromJson(tickHistoryMap);

    expect(tickHistory.history.prices.first, 218.6404);
    expect(tickHistory.history.times.first, 1587556946);
  });
}