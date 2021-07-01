/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_virtual_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// New account virtual request class.
class NewAccountVirtualRequest extends Request {
  /// Initialize NewAccountVirtualRequest.
  const NewAccountVirtualRequest({
    this.affiliateToken,
    required this.clientPassword,
    this.dateFirstContact,
    this.emailConsent,
    this.gclidUrl,
    this.newAccountVirtual = true,
    required this.residence,
    this.signupDevice,
    required this.type,
    this.utmAdId,
    this.utmAdgroupId,
    this.utmAdrollclkId,
    this.utmCampaign,
    this.utmCampaignId,
    this.utmContent,
    this.utmFbclId,
    this.utmGlClientId,
    this.utmMedium,
    this.utmMsclkId,
    this.utmSource,
    this.utmTerm,
    required this.verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'new_account_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory NewAccountVirtualRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualRequest(
        affiliateToken: json['affiliate_token'] as String?,
        clientPassword: json['client_password'] as String?,
        dateFirstContact: json['date_first_contact'] as String?,
        emailConsent: json['email_consent'] as int?,
        gclidUrl: json['gclid_url'] as String?,
        newAccountVirtual: json['new_account_virtual'] == null
            ? null
            : json['new_account_virtual'] == 1,
        residence: json['residence'] as String?,
        signupDevice: json['signup_device'] as String?,
        type: json['type'] as String?,
        utmAdId: json['utm_ad_id'] as dynamic,
        utmAdgroupId: json['utm_adgroup_id'] as dynamic,
        utmAdrollclkId: json['utm_adrollclk_id'] as dynamic,
        utmCampaign: json['utm_campaign'] as dynamic,
        utmCampaignId: json['utm_campaign_id'] as dynamic,
        utmContent: json['utm_content'] as dynamic,
        utmFbclId: json['utm_fbcl_id'] as dynamic,
        utmGlClientId: json['utm_gl_client_id'] as dynamic,
        utmMedium: json['utm_medium'] as dynamic,
        utmMsclkId: json['utm_msclk_id'] as dynamic,
        utmSource: json['utm_source'] as dynamic,
        utmTerm: json['utm_term'] as dynamic,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Affiliate token, within 32 characters.
  final String? affiliateToken;

  /// Password (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String? clientPassword;

  /// [Optional] Date of first contact, format: `yyyy-mm-dd` in GMT timezone.
  final String? dateFirstContact;

  /// [Optional] Boolean value: 1 or 0, indicating whether the client has given consent for marketing emails.
  final int? emailConsent;

  /// [Optional] Google Click Identifier to track source.
  final String? gclidUrl;

  /// Must be `true`
  final bool? newAccountVirtual;

  /// 2-letter country code (obtained from `residence_list` call).
  final String? residence;

  /// [Optional] Show whether user has used mobile or desktop.
  final String? signupDevice;

  /// Account type
  final String? type;

  /// [Optional] Identifier of particular ad. Value must match Regex pattern to be recorded
  final dynamic utmAdId;

  /// [Optional] Identifier of ad group in the campaign. Value must match Regex pattern to be recorded
  final dynamic utmAdgroupId;

  /// [Optional] Unique identifier of click on AdRoll ads platform. Value must match Regex pattern to be recorded
  final dynamic utmAdrollclkId;

  /// [Optional] Identifies a specific product promotion or strategic campaign such as a spring sale or other promotions. Value must match Regex pattern to be recorded
  final dynamic utmCampaign;

  /// [Optional] Identifier of paid ad campaign. Value must match Regex pattern to be recorded
  final dynamic utmCampaignId;

  /// [Optional] Used to differentiate similar content, or links within the same ad. Value must match Regex pattern to be recorded
  final dynamic utmContent;

  /// [Optional] Unique identifier of click on Facebook ads platform. Value must match Regex pattern to be recorded
  final dynamic utmFbclId;

  /// [Optional] Unique visitor identifier on Google Ads platform. Value must match Regex pattern to be recorded
  final dynamic utmGlClientId;

  /// [Optional] Identifies the medium the link was used upon such as: email, CPC, or other methods of sharing. Value must match Regex pattern to be recorded
  final dynamic utmMedium;

  /// [Optional] Unique click identifier on Microsoft Bing ads platform. Value must match Regex pattern to be recorded
  final dynamic utmMsclkId;

  /// [Optional] Identifies the source of traffic such as: search engine, newsletter, or other referral. Value must match Regex pattern to be recorded
  final dynamic utmSource;

  /// [Optional] Used to send information related to the campaign term like paid search keywords. Value must match Regex pattern to be recorded
  final dynamic utmTerm;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'affiliate_token': affiliateToken,
        'client_password': clientPassword,
        'date_first_contact': dateFirstContact,
        'email_consent': emailConsent,
        'gclid_url': gclidUrl,
        'new_account_virtual': newAccountVirtual == null
            ? null
            : newAccountVirtual!
                ? 1
                : 0,
        'residence': residence,
        'signup_device': signupDevice,
        'type': type,
        'utm_ad_id': utmAdId,
        'utm_adgroup_id': utmAdgroupId,
        'utm_adrollclk_id': utmAdrollclkId,
        'utm_campaign': utmCampaign,
        'utm_campaign_id': utmCampaignId,
        'utm_content': utmContent,
        'utm_fbcl_id': utmFbclId,
        'utm_gl_client_id': utmGlClientId,
        'utm_medium': utmMedium,
        'utm_msclk_id': utmMsclkId,
        'utm_source': utmSource,
        'utm_term': utmTerm,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountVirtualRequest copyWith({
    String? affiliateToken,
    String? clientPassword,
    String? dateFirstContact,
    int? emailConsent,
    String? gclidUrl,
    bool? newAccountVirtual,
    String? residence,
    String? signupDevice,
    String? type,
    dynamic utmAdId,
    dynamic utmAdgroupId,
    dynamic utmAdrollclkId,
    dynamic utmCampaign,
    dynamic utmCampaignId,
    dynamic utmContent,
    dynamic utmFbclId,
    dynamic utmGlClientId,
    dynamic utmMedium,
    dynamic utmMsclkId,
    dynamic utmSource,
    dynamic utmTerm,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NewAccountVirtualRequest(
        affiliateToken: affiliateToken ?? this.affiliateToken,
        clientPassword: clientPassword ?? this.clientPassword,
        dateFirstContact: dateFirstContact ?? this.dateFirstContact,
        emailConsent: emailConsent ?? this.emailConsent,
        gclidUrl: gclidUrl ?? this.gclidUrl,
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        residence: residence ?? this.residence,
        signupDevice: signupDevice ?? this.signupDevice,
        type: type ?? this.type,
        utmAdId: utmAdId ?? this.utmAdId,
        utmAdgroupId: utmAdgroupId ?? this.utmAdgroupId,
        utmAdrollclkId: utmAdrollclkId ?? this.utmAdrollclkId,
        utmCampaign: utmCampaign ?? this.utmCampaign,
        utmCampaignId: utmCampaignId ?? this.utmCampaignId,
        utmContent: utmContent ?? this.utmContent,
        utmFbclId: utmFbclId ?? this.utmFbclId,
        utmGlClientId: utmGlClientId ?? this.utmGlClientId,
        utmMedium: utmMedium ?? this.utmMedium,
        utmMsclkId: utmMsclkId ?? this.utmMsclkId,
        utmSource: utmSource ?? this.utmSource,
        utmTerm: utmTerm ?? this.utmTerm,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
