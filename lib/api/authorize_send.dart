/// generated automatically from flutter_deriv_api|lib/api/authorize_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'authorize_send.g.dart';

/// JSON conversion for 'authorize_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AuthorizeRequest extends Request {
  /// Initialize AuthorizeRequest
  const AuthorizeRequest({
    this.addToLoginHistory,
    this.authorize,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeRequestFromJson(json);

  // Properties
  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  final int addToLoginHistory;

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  final String authorize;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AuthorizeRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AuthorizeRequest copyWith({
    int addToLoginHistory,
    String authorize,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      AuthorizeRequest(
        addToLoginHistory: addToLoginHistory ?? this.addToLoginHistory,
        authorize: authorize ?? this.authorize,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
