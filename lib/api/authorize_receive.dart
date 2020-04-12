/// generated automatically from flutter_deriv_api|lib/api/authorize_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'authorize_receive.g.dart';

/// JSON conversion for 'authorize_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AuthorizeResponse extends Response {
  /// Initialize AuthorizeResponse
  AuthorizeResponse({
    this.authorize,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory AuthorizeResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizeResponseFromJson(json);

  // Properties
  /// Account information for the holder of the token.
  final Map<String, dynamic> authorize;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AuthorizeResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AuthorizeResponse copyWith({
    Map<String, dynamic> authorize,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AuthorizeResponse(
        authorize: authorize ?? this.authorize,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
