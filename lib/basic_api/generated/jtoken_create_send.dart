/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/jtoken_create_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Jtoken create request class.
class JtokenCreateRequest extends Request {
  /// Initialize JtokenCreateRequest.
  const JtokenCreateRequest({
    this.jtokenCreate = true,
    this.loginid,
    super.msgType = 'jtoken_create',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory JtokenCreateRequest.fromJson(Map<String, dynamic> json) =>
      JtokenCreateRequest(
        jtokenCreate:
            json['jtoken_create'] == null ? null : json['jtoken_create'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? jtokenCreate;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'jtoken_create': jtokenCreate == null
            ? null
            : jtokenCreate!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  JtokenCreateRequest copyWith({
    bool? jtokenCreate,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      JtokenCreateRequest(
        jtokenCreate: jtokenCreate ?? this.jtokenCreate,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
