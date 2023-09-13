/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/unsubscribe_email_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Unsubscribe email receive class.
class UnsubscribeEmailReceive extends Response {
  /// Initialize UnsubscribeEmailReceive.
  const UnsubscribeEmailReceive({
    this.binaryUserId,
    this.emailUnsubscribeStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory UnsubscribeEmailReceive.fromJson(Map<String, dynamic> json) =>
      UnsubscribeEmailReceive(
        binaryUserId: json['binary_user_id'] as num?,
        emailUnsubscribeStatus: json['email_unsubscribe_status'] == null
            ? null
            : json['email_unsubscribe_status'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Customer User ID.
  final num? binaryUserId;

  /// `true`: email notification unsubscribed sucssesfully, `false`: failed to unsubscribed email notification
  final bool? emailUnsubscribeStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_user_id': binaryUserId,
        'email_unsubscribe_status': emailUnsubscribeStatus == null
            ? null
            : emailUnsubscribeStatus!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  UnsubscribeEmailReceive copyWith({
    num? binaryUserId,
    bool? emailUnsubscribeStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      UnsubscribeEmailReceive(
        binaryUserId: binaryUserId ?? this.binaryUserId,
        emailUnsubscribeStatus:
            emailUnsubscribeStatus ?? this.emailUnsubscribeStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
