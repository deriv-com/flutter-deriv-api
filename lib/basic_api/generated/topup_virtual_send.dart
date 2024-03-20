/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Topup virtual request class.
class TopupVirtualRequest extends Request {
  /// Initialize TopupVirtualRequest.
  const TopupVirtualRequest({
    this.loginid,
    this.topupVirtual = true,
    super.msgType = 'topup_virtual',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TopupVirtualRequest.fromJson(Map<String, dynamic> json) =>
      TopupVirtualRequest(
        loginid: json['loginid'] as String?,
        topupVirtual:
            json['topup_virtual'] == null ? null : json['topup_virtual'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? topupVirtual;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'topup_virtual': topupVirtual == null
            ? null
            : topupVirtual!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualRequest copyWith({
    String? loginid,
    bool? topupVirtual,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TopupVirtualRequest(
        loginid: loginid ?? this.loginid,
        topupVirtual: topupVirtual ?? this.topupVirtual,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
