/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/authorize_send.json

import '../request.dart';

/// Authorize request class
class AuthorizeRequest extends Request {
  /// Initialize AuthorizeRequest
  const AuthorizeRequest({
    this.addToLoginHistory,
    @required this.authorize,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'authorize',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      AuthorizeRequest(
        addToLoginHistory: json['add_to_login_history'] as int?,
        authorize: json['authorize'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  final int? addToLoginHistory;

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  final String? authorize;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'add_to_login_history': addToLoginHistory,
        'authorize': authorize,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AuthorizeRequest copyWith({
    int? addToLoginHistory,
    String? authorize,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AuthorizeRequest(
        addToLoginHistory: addToLoginHistory ?? this.addToLoginHistory,
        authorize: authorize ?? this.authorize,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
