/// generated automatically from flutter_deriv_api|lib/api/api_token_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'api_token_receive.g.dart';

/// JSON conversion for 'api_token_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ApiTokenResponse extends Response {
  /// Initialize ApiTokenResponse
  const ApiTokenResponse({
    this.apiToken,
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
  factory ApiTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiTokenResponseFromJson(json);

  // Properties
  /// Contains the result of API token according to the type of request.
  final Map<String, dynamic> apiToken;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ApiTokenResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ApiTokenResponse copyWith({
    Map<String, dynamic> apiToken,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ApiTokenResponse(
        apiToken: apiToken ?? this.apiToken,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
