/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/authorize_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'authorize_receive.g.dart';

/// JSON conversion for 'authorize_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class AuthorizeResponse extends Response {
  /// Initialize AuthorizeResponse
  const AuthorizeResponse({
    this.authorize,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AuthorizeResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeResponseFromJson(json);

  /// Account information for the holder of the token.
  final Map<String, dynamic> authorize;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AuthorizeResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AuthorizeResponse copyWith({
    Map<String, dynamic> authorize,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AuthorizeResponse(
        authorize: authorize ?? this.authorize,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
