/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_virtual_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// NewAccountVirtualRequest class
class NewAccountVirtualRequest extends Request {
  /// Initialize NewAccountVirtualRequest
  const NewAccountVirtualRequest({
    this.affiliateToken,
    @required this.clientPassword,
    this.dateFirstContact,
    this.gclidUrl,
    this.newAccountVirtual = true,
    @required this.residence,
    this.signupDevice,
    this.utmCampaign,
    this.utmMedium,
    this.utmSource,
    @required this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'new_account_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtualRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualRequest(
        affiliateToken: json['affiliate_token'] as String,
        clientPassword: json['client_password'] as String,
        dateFirstContact: json['date_first_contact'] as String,
        gclidUrl: json['gclid_url'] as String,
        newAccountVirtual: json['new_account_virtual'] == null
            ? null
            : json['new_account_virtual'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        residence: json['residence'] as String,
        signupDevice: json['signup_device'] as String,
        utmCampaign: json['utm_campaign'] as String,
        utmMedium: json['utm_medium'] as String,
        utmSource: json['utm_source'] as String,
        verificationCode: json['verification_code'] as String,
      );

  /// [Optional] Affiliate token, within 32 characters.
  final String affiliateToken;

  /// Password (length within 6-25 chars, accepts any printable ASCII character).
  final String clientPassword;

  /// [Optional] Date of first contact, format: `yyyy-mm-dd` in GMT timezone.
  final String dateFirstContact;

  /// [Optional] Google Click Identifier to track source.
  final String gclidUrl;

  /// Must be `true`
  final bool newAccountVirtual;

  /// 2-letter country code (obtained from `residence_list` call).
  final String residence;

  /// [Optional] Show whether user has used mobile or desktop.
  final String signupDevice;

  /// [Optional] Identifies a specific product promotion or strategic campaign such as a spring sale or other promotions.
  final String utmCampaign;

  /// [Optional] Identifies the medium the link was used upon such as: email, CPC, or other methods of sharing.
  final String utmMedium;

  /// [Optional] Identifies the source of traffic such as: search engine, newsletter, or other referral.
  final String utmSource;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String verificationCode;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_token': affiliateToken,
        'client_password': clientPassword,
        'date_first_contact': dateFirstContact,
        'gclid_url': gclidUrl,
        'new_account_virtual':
            newAccountVirtual == null ? null : newAccountVirtual ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
        'residence': residence,
        'signup_device': signupDevice,
        'utm_campaign': utmCampaign,
        'utm_medium': utmMedium,
        'utm_source': utmSource,
        'verification_code': verificationCode,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountVirtualRequest copyWith({
    String affiliateToken,
    String clientPassword,
    String dateFirstContact,
    String gclidUrl,
    bool newAccountVirtual,
    String residence,
    String signupDevice,
    String utmCampaign,
    String utmMedium,
    String utmSource,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      NewAccountVirtualRequest(
        affiliateToken: affiliateToken ?? this.affiliateToken,
        clientPassword: clientPassword ?? this.clientPassword,
        dateFirstContact: dateFirstContact ?? this.dateFirstContact,
        gclidUrl: gclidUrl ?? this.gclidUrl,
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        residence: residence ?? this.residence,
        signupDevice: signupDevice ?? this.signupDevice,
        utmCampaign: utmCampaign ?? this.utmCampaign,
        utmMedium: utmMedium ?? this.utmMedium,
        utmSource: utmSource ?? this.utmSource,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
