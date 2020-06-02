import '../manually/ohlc_receive.dart';
import '../response.dart';

import 'response_mapper.helper.dart';


/// creates a sub-type of [Response] based on [responseMap]'s 'msg_type'
///
/// Exceptional cases will be added here, the rest will be found in auto-generated
/// file.
Response getResponseByMsgType(Map<String, dynamic> responseMap) {
  switch (responseMap['msg_type']) {
    case 'ohlc':
      return OHLCResponse.fromJson(responseMap);
    default:
      return getGeneratedResponse(responseMap);
  }
}
