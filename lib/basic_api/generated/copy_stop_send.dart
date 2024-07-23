/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Copy stop request class.
class CopyStopRequest extends Request {
  /// Initialize CopyStopRequest.
  const CopyStopRequest({
    required this.copyStop,
    this.loginid,
    super.msgType = 'copy_stop',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CopyStopRequest.fromJson(Map<String, dynamic> json) =>
      CopyStopRequest(
        copyStop: json['copy_stop'] as String?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// API tokens identifying the accounts which needs not to be copied
  final String? copyStop;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_stop': copyStop,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStopRequest copyWith({
    String? copyStop,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CopyStopRequest(
        copyStop: copyStop ?? this.copyStop,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
