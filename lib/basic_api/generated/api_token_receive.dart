/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/api_token_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'api_token_receive.g.dart';

/// JSON conversion for 'api_token_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ApiTokenResponse extends Response {
  /// Initialize ApiTokenResponse
  const ApiTokenResponse({
    this.apiToken,
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
  factory ApiTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiTokenResponseFromJson(json);

  /// Contains the result of API token according to the type of request.
  final Map<String, dynamic> apiToken;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ApiTokenResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ApiTokenResponse copyWith({
    Map<String, dynamic> apiToken,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ApiTokenResponse(
        apiToken: apiToken ?? this.apiToken,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
