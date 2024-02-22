/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/authorize_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Authorize request class.
class AuthorizeRequest extends Request {
  /// Initialize AuthorizeRequest.
  const AuthorizeRequest({
    this.addToLoginHistory,
    required this.authorize,
    required this.tokens,
    super.msgType = 'authorize',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      AuthorizeRequest(
        addToLoginHistory: json['add_to_login_history'] == null
            ? null
            : json['add_to_login_history'] == 1,
        authorize: json['authorize'] as String?,
        tokens: (json['tokens'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  final bool? addToLoginHistory;

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  final String? authorize;

  /// Additional Authentication tokens of authorized user that may be used in this session. Upto 10 tokens.
  final List<String>? tokens;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'add_to_login_history': addToLoginHistory == null
            ? null
            : addToLoginHistory!
                ? 1
                : 0,
        'authorize': authorize,
        'tokens': tokens,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AuthorizeRequest copyWith({
    bool? addToLoginHistory,
    String? authorize,
    List<String>? tokens,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AuthorizeRequest(
        addToLoginHistory: addToLoginHistory ?? this.addToLoginHistory,
        authorize: authorize ?? this.authorize,
        tokens: tokens ?? this.tokens,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
