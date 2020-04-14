/// generated automatically from flutter_deriv_api|lib/api/service_token_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'service_token_receive.g.dart';

/// JSON conversion for 'service_token_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ServiceTokenResponse extends Response {
  /// Initialize ServiceTokenResponse
  const ServiceTokenResponse({
    this.serviceToken,
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

  /// Creates instance from JSON
  factory ServiceTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceTokenResponseFromJson(json);

  // Properties
  /// The object containing the retrieved token
  final Map<String, dynamic> serviceToken;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ServiceTokenResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ServiceTokenResponse copyWith({
    Map<String, dynamic> serviceToken,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ServiceTokenResponse(
        serviceToken: serviceToken ?? this.serviceToken,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
