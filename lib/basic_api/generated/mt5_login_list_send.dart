/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_login_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Mt5 login list request class.
class Mt5LoginListRequest extends Request {
  /// Initialize Mt5LoginListRequest.
  const Mt5LoginListRequest({
    this.mt5LoginList = true,
    super.msgType = 'mt5_login_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5LoginListRequest.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListRequest(
        mt5LoginList:
            json['mt5_login_list'] == null ? null : json['mt5_login_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? mt5LoginList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_login_list': mt5LoginList == null
            ? null
            : mt5LoginList!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5LoginListRequest copyWith({
    bool? mt5LoginList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Mt5LoginListRequest(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
