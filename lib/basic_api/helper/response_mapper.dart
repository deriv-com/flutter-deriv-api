import 'package:flutter_deriv_api/api/manually/ohlc_response.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_history_receive.dart';

import '../response.dart';

import 'response_mapper.helper.dart';

/// Creates a sub-type of [Response] object based on [responseMap]'s 'msg_type'
///
/// Exceptional cases will be added here, the rest will be auto-generated from
/// JSON schemas by [APIHelperBuilder]
Response getResponseByMsgType(Map<String, dynamic> responseMap) {
  switch (responseMap['msg_type']) {
    case 'ohlc':
      return OHLCResponse.fromJson(responseMap);
    case 'candles':
    case 'history':
      return TicksHistoryReceive.fromJson(responseMap);

    default:
      return getGeneratedResponse(responseMap);
  }
}
