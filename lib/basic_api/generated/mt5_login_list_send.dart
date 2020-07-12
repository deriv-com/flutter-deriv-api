/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_login_list_send.json

import '../request.dart';

/// Mt5LoginListRequest class
class Mt5LoginListRequest extends Request {
  /// Initialize Mt5LoginListRequest
  const Mt5LoginListRequest({
    this.mt5LoginList = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'mt5_login_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListRequest.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListRequest(
        // ignore: avoid_as
        mt5LoginList: json['mt5_login_list'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int mt5LoginList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_login_list': mt5LoginList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5LoginListRequest copyWith({
    int mt5LoginList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Mt5LoginListRequest(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
