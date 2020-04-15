/// generated automatically from flutter_deriv_api|lib/api/service_token_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'service_token_send.g.dart';

/// JSON conversion for 'service_token_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ServiceTokenRequest extends Request {
  /// Initialize ServiceTokenRequest
  const ServiceTokenRequest({
    this.referrer,
    this.service,
    this.serviceToken = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ServiceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceTokenRequestFromJson(json);

  // Properties
  /// [Optional] The URL of the web page where the Web SDK will be used.
  final String referrer;

  /// The service name to retrieve the token for.
  final String service;

  /// Must be `1`
  final int serviceToken;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ServiceTokenRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ServiceTokenRequest copyWith({
    String referrer,
    String service,
    int serviceToken,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ServiceTokenRequest(
        referrer: referrer ?? this.referrer,
        service: service ?? this.service,
        serviceToken: serviceToken ?? this.serviceToken,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
