/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_status_send.json

import '../request.dart';

/// GetAccountStatusRequest class
class GetAccountStatusRequest extends Request {
  /// Initialize GetAccountStatusRequest
  const GetAccountStatusRequest({
    this.getAccountStatus = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_account_status',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetAccountStatusRequest.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusRequest(
        // ignore: avoid_as
        getAccountStatus: json['get_account_status'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int getAccountStatus;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_account_status': getAccountStatus,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountStatusRequest copyWith({
    int getAccountStatus,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetAccountStatusRequest(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
