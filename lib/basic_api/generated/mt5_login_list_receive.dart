/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_login_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 login list receive class.
class Mt5LoginListReceive extends Response {
  /// Initialize Mt5LoginListReceive.
  const Mt5LoginListReceive({
    this.mt5LoginList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5LoginListReceive.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListReceive(
        mt5LoginList: (json['mt5_login_list'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Array containing MT5 account objects.
  final List<Map<String, dynamic>>? mt5LoginList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_login_list': mt5LoginList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5LoginListReceive copyWith({
    List<Map<String, dynamic>>? mt5LoginList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5LoginListReceive(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
