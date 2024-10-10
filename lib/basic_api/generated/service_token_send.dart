/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/service_token_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Service token request class.
class ServiceTokenRequest extends Request {
  /// Initialize ServiceTokenRequest.
  const ServiceTokenRequest({
    this.country,
    this.extraFields,
    this.loginid,
    this.referrer,
    required this.server,
    this.service,
    this.serviceToken = true,
    super.msgType = 'service_token',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ServiceTokenRequest.fromJson(Map<String, dynamic> json) =>
      ServiceTokenRequest(
        country: json['country'] as String?,
        extraFields: json['extra_fields'] as Map<String, dynamic>?,
        loginid: json['loginid'] as String?,
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

  /// [Optional] Valid fields depend on the service type.
  final Map<String, dynamic>? extraFields;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// [Optional] The URL of the web page where the Web SDK will be used.
  final String? referrer;

  /// Server (dxtrade).
  final String? server;

  /// The service(s) to retrieve token(s) for.
  final dynamic service;

  /// Must be `true`
  final bool? serviceToken;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'extra_fields': extraFields,
        'loginid': loginid,
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
    Map<String, dynamic>? extraFields,
    String? loginid,
    String? referrer,
    String? server,
    dynamic service,
    bool? serviceToken,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ServiceTokenRequest(
        country: country ?? this.country,
        extraFields: extraFields ?? this.extraFields,
        loginid: loginid ?? this.loginid,
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
