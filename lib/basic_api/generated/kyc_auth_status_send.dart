/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/kyc_auth_status_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Kyc auth status request class.
class KycAuthStatusRequest extends Request {
  /// Initialize KycAuthStatusRequest.
  const KycAuthStatusRequest({
    required this.country,
    this.kycAuthStatus = true,
    required this.landingCompanies,
    this.loginid,
    super.msgType = 'kyc_auth_status',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatusRequest.fromJson(Map<String, dynamic> json) =>
      KycAuthStatusRequest(
        country: json['country'] as String?,
        kycAuthStatus: json['kyc_auth_status'] == null
            ? null
            : json['kyc_auth_status'] == 1,
        landingCompanies: (json['landing_companies'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The country for which service availability is being verified, 2-letter country code
  final String? country;

  /// Must be `true`
  final bool? kycAuthStatus;

  /// Indicates which landing companies to get the KYC authentication status for.
  final List<String>? landingCompanies;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'kyc_auth_status': kycAuthStatus == null
            ? null
            : kycAuthStatus!
                ? 1
                : 0,
        'landing_companies': landingCompanies,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  KycAuthStatusRequest copyWith({
    String? country,
    bool? kycAuthStatus,
    List<String>? landingCompanies,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      KycAuthStatusRequest(
        country: country ?? this.country,
        kycAuthStatus: kycAuthStatus ?? this.kycAuthStatus,
        landingCompanies: landingCompanies ?? this.landingCompanies,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
