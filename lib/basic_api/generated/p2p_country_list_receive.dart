/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_country_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// P2p country list receive class.
class P2pCountryListReceive extends Response {
  /// Initialize P2pCountryListReceive.
  const P2pCountryListReceive({
    this.p2pCountryList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pCountryListReceive.fromJson(Map<String, dynamic> json) =>
      P2pCountryListReceive(
        p2pCountryList: json['p2p_country_list'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Country identified by country code
  final Map<String, dynamic>? p2pCountryList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'p2p_country_list': p2pCountryList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pCountryListReceive copyWith({
    Map<String, dynamic>? p2pCountryList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      P2pCountryListReceive(
        p2pCountryList: p2pCountryList ?? this.p2pCountryList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
