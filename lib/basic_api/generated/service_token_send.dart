/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/service_token_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Service token request class.
class ServiceTokenRequest extends Request {
  /// Initialize ServiceTokenRequest.
  const ServiceTokenRequest({
    this.country,
    this.referrer,
    required this.server,
    this.service,
    this.serviceToken = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'service_token',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ServiceTokenRequest.fromJson(Map<String, dynamic> json) =>
      ServiceTokenRequest(
        country: json['country'] as String?,
        referrer: json['referrer'] as String?,
        server: json['server'] as String?,
        service: json['service'] as dynamic,
        serviceToken:
            json['service_token'] == null ? null : json['service_token'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The 2-letter country code.
  final String? country;

  /// [Optional] The URL of the web page where the Web SDK will be used.
  final String? referrer;

  /// Server (dxtrade only).
  final String? server;

  /// The service(s) to retrieve token(s) for.
  final dynamic service;

  /// Must be `true`
  final bool? serviceToken;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'referrer': referrer,
        'server': server,
        'service': service,
        'service_token': serviceToken == null
            ? null
            : serviceToken!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ServiceTokenRequest copyWith({
    String? country,
    String? referrer,
    String? server,
    dynamic service,
    bool? serviceToken,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ServiceTokenRequest(
        country: country ?? this.country,
        referrer: referrer ?? this.referrer,
        server: server ?? this.server,
        service: service ?? this.service,
        serviceToken: serviceToken ?? this.serviceToken,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
