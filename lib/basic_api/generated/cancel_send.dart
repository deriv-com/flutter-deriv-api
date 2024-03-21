/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Cancel request class.
class CancelRequest extends Request {
  /// Initialize CancelRequest.
  const CancelRequest({
    required this.cancel,
    this.loginid,
    super.msgType = 'cancel',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CancelRequest.fromJson(Map<String, dynamic> json) => CancelRequest(
        cancel: json['cancel'] as int?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Value should be the `contract_id` which received from the `portfolio` call.
  final int? cancel;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'cancel': cancel,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CancelRequest copyWith({
    int? cancel,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CancelRequest(
        cancel: cancel ?? this.cancel,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
