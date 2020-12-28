/// New account virtual send model class
abstract class NewAccountVirtualSendModel {
  /// Initializes
  NewAccountVirtualSendModel({
    @required this.newAccountVirtual,
    this.affiliateToken,
    @required this.clientPassword,
    this.dateFirstContact,
    this.gclidUrl,
    @required this.residence,
    this.signupDevice,
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
    @required this.verificationCode,
  });

  /// Must be `1`
  final int newAccountVirtual;

  /// [Optional] Affiliate token, within 32 characters.
  final String affiliateToken;

  /// Password (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address).
  final String clientPassword;

  /// [Optional] Date of first contact, format: `yyyy-mm-dd` in GMT timezone.
  final String dateFirstContact;

  /// [Optional] Google Click Identifier to track source.
  final String gclidUrl;

  /// 2-letter country code (obtained from `residence_list` call).
  final String residence;

  /// [Optional] Show whether user has used mobile or desktop.
  final SignupDeviceEnum signupDevice;

  /// [Optional] Identifier of particular ad
  final String utmAdId;

  /// [Optional] Identifier of ad group in the campaign
  final String utmAdgroupId;

  /// [Optional] Unique identifier of click on AdRoll ads platform
  final String utmAdrollclkId;

  /// [Optional] Identifies a specific product promotion or strategic campaign such as a spring sale or other promotions.
  final String utmCampaign;

  /// [Optional] Identifier of paid ad campaign
  final String utmCampaignId;

  /// [Optional] Used to differentiate similar content, or links within the same ad
  final String utmContent;

  /// [Optional] Unique identifier of click on Facebook ads platform
  final String utmFbclId;

  /// [Optional] Unique visitor identifier on Google Ads platform.
  final String utmGlClientId;

  /// [Optional] Identifies the medium the link was used upon such as: email, CPC, or other methods of sharing.
  final String utmMedium;

  /// [Optional] Unique click identifier on Microsoft Bing ads platform.
  final String utmMsclkId;

  /// [Optional] Identifies the source of traffic such as: search engine, newsletter, or other referral.
  final String utmSource;

  /// [Optional] Used to send information related to the campaign term like paid search keywords
  final String utmTerm;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String verificationCode;
}

/// New account virtual send class
class NewAccountVirtualSend extends NewAccountVirtualSendModel {
  /// Initializes
  NewAccountVirtualSend({
    @required int newAccountVirtual,
    String affiliateToken,
    @required String clientPassword,
    String dateFirstContact,
    String gclidUrl,
    @required String residence,
    String signupDevice,
    String utmAdId,
    String utmAdgroupId,
    String utmAdrollclkId,
    String utmCampaign,
    String utmCampaignId,
    String utmContent,
    String utmFbclId,
    String utmGlClientId,
    String utmMedium,
    String utmMsclkId,
    String utmSource,
    String utmTerm,
    @required String verificationCode,
  }) : super(
          newAccountVirtual: newAccountVirtual,
          affiliateToken: affiliateToken,
          clientPassword: clientPassword,
          dateFirstContact: dateFirstContact,
          gclidUrl: gclidUrl,
          residence: residence,
          signupDevice: signupDevice,
          utmAdId: utmAdId,
          utmAdgroupId: utmAdgroupId,
          utmAdrollclkId: utmAdrollclkId,
          utmCampaign: utmCampaign,
          utmCampaignId: utmCampaignId,
          utmContent: utmContent,
          utmFbclId: utmFbclId,
          utmGlClientId: utmGlClientId,
          utmMedium: utmMedium,
          utmMsclkId: utmMsclkId,
          utmSource: utmSource,
          utmTerm: utmTerm,
          verificationCode: verificationCode,
        );

  /// Creates an instance from JSON
  factory NewAccountVirtualSend.fromJson(Map<String, dynamic> json) =>
      NewAccountVirtualSend(
        newAccountVirtual: json['new_account_virtual'],
        affiliateToken: json['affiliate_token'],
        clientPassword: json['client_password'],
        dateFirstContact: json['date_first_contact'],
        gclidUrl: json['gclid_url'],
        residence: json['residence'],
        signupDevice: json['signup_device'] == null
            ? null
            : signupDeviceEnumMapper.entries
                .firstWhere((entry) => entry.value == json['signup_device'],
                    orElse: () => null)
                ?.key,
        utmAdId: json['utm_ad_id'],
        utmAdgroupId: json['utm_adgroup_id'],
        utmAdrollclkId: json['utm_adrollclk_id'],
        utmCampaign: json['utm_campaign'],
        utmCampaignId: json['utm_campaign_id'],
        utmContent: json['utm_content'],
        utmFbclId: json['utm_fbcl_id'],
        utmGlClientId: json['utm_gl_client_id'],
        utmMedium: json['utm_medium'],
        utmMsclkId: json['utm_msclk_id'],
        utmSource: json['utm_source'],
        utmTerm: json['utm_term'],
        verificationCode: json['verification_code'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['new_account_virtual'] = newAccountVirtual;
    result['affiliate_token'] = affiliateToken;
    result['client_password'] = clientPassword;
    result['date_first_contact'] = dateFirstContact;
    result['gclid_url'] = gclidUrl;
    result['residence'] = residence;
    result['signup_device'] = signupDeviceEnumMapper[signupDevice];
    result['utm_ad_id'] = utmAdId;
    result['utm_adgroup_id'] = utmAdgroupId;
    result['utm_adrollclk_id'] = utmAdrollclkId;
    result['utm_campaign'] = utmCampaign;
    result['utm_campaign_id'] = utmCampaignId;
    result['utm_content'] = utmContent;
    result['utm_fbcl_id'] = utmFbclId;
    result['utm_gl_client_id'] = utmGlClientId;
    result['utm_medium'] = utmMedium;
    result['utm_msclk_id'] = utmMsclkId;
    result['utm_source'] = utmSource;
    result['utm_term'] = utmTerm;
    result['verification_code'] = verificationCode;

    return result;
  }

  /// Creates a copy of instance with given parameters
  NewAccountVirtualSend copyWith({
    int newAccountVirtual,
    String affiliateToken,
    String clientPassword,
    String dateFirstContact,
    String gclidUrl,
    String residence,
    String signupDevice,
    String utmAdId,
    String utmAdgroupId,
    String utmAdrollclkId,
    String utmCampaign,
    String utmCampaignId,
    String utmContent,
    String utmFbclId,
    String utmGlClientId,
    String utmMedium,
    String utmMsclkId,
    String utmSource,
    String utmTerm,
    String verificationCode,
  }) =>
      NewAccountVirtualSend(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        affiliateToken: affiliateToken ?? this.affiliateToken,
        clientPassword: clientPassword ?? this.clientPassword,
        dateFirstContact: dateFirstContact ?? this.dateFirstContact,
        gclidUrl: gclidUrl ?? this.gclidUrl,
        residence: residence ?? this.residence,
        signupDevice: signupDevice ?? this.signupDevice,
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
      );
  // Creating Enum Mappers

  static final Map<SignupDeviceEnum, String> signupDeviceEnumMapper = {
    SignupDeviceEnum.desktop: 'desktop',
    SignupDeviceEnum.mobile: 'mobile',
  };
}

// Creating Enums

enum SignupDeviceEnum {
  desktop,
  mobile,
}
