/// generated automatically from flutter_deriv_api|lib/basic_api/generated/authorize_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'authorize_send.g.dart';

/// JSON conversion for 'authorize_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AuthorizeRequest extends Request {
  /// Initialize AuthorizeRequest
  const AuthorizeRequest({
    this.addToLoginHistory,
    this.authorize,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'authorize',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeRequestFromJson(json);

  // Properties
  /// [Optional] Send this when you use api tokens for authorization and want to track activity using `login_history` call.
  final int addToLoginHistory;

  /// Authentication token. May be retrieved from https://www.binary.com/en/user/security/api_tokenws.html
  final String authorize;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$AuthorizeRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AuthorizeRequest copyWith({
    int addToLoginHistory,
    String authorize,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AuthorizeRequest(
        addToLoginHistory: addToLoginHistory ?? this.addToLoginHistory,
        authorize: authorize ?? this.authorize,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
