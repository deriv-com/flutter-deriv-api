/// Verify email send model class
abstract class VerifyEmailSendModel {
  /// Initializes
  VerifyEmailSendModel({
    @required this.verifyEmail,
    @required this.type,
    this.urlParameters,
  });

  /// Email address to be verified.
  final String verifyEmail;

  /// Purpose of the email verification call.
  final TypeEnum type;

  /// [Optional] Extra parameters that can be attached to the verify email link URL.
  final UrlParameters urlParameters;
}

/// Verify email send class
class VerifyEmailSend extends VerifyEmailSendModel {
  /// Initializes
  VerifyEmailSend({
    @required String verifyEmail,
    @required String type,
    UrlParameters urlParameters,
  }) : super(
          verifyEmail: verifyEmail,
          type: type,
          urlParameters: urlParameters,
        );

  /// Creates an instance from JSON
  factory VerifyEmailSend.fromJson(Map<String, dynamic> json) =>
      VerifyEmailSend(
        verifyEmail: json['verify_email'],
        type: json['type'] == null
            ? null
            : typeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['type'],
                    orElse: () => null)
                ?.key,
        urlParameters: json['url_parameters'] == null
            ? null
            : UrlParameters.fromJson(json['url_parameters']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['verify_email'] = verifyEmail;
    result['type'] = typeEnumMapper[type];
    if (urlParameters != null) {
      result['url_parameters'] = urlParameters.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  VerifyEmailSend copyWith({
    String verifyEmail,
    String type,
    UrlParameters urlParameters,
  }) =>
      VerifyEmailSend(
        verifyEmail: verifyEmail ?? this.verifyEmail,
        type: type ?? this.type,
        urlParameters: urlParameters ?? this.urlParameters,
      );
  // Creating Enum Mappers

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.account_opening: 'account_opening',
    TypeEnum.reset_password: 'reset_password',
    TypeEnum.paymentagent_withdraw: 'paymentagent_withdraw',
    TypeEnum.payment_withdraw: 'payment_withdraw',
    TypeEnum.mt5_password_reset: 'mt5_password_reset',
  };
}

// Creating Enums

enum TypeEnum {
  account_opening,
  reset_password,
  paymentagent_withdraw,
  payment_withdraw,
  mt5_password_reset,
}
/// Url parameters model class
abstract class UrlParametersModel {
  /// Initializes
  UrlParametersModel({
    this.affiliateToken,
    this.dateFirstContact,
    this.gclidUrl,
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
  });

  /// [Optional] Affiliate token, within 32 characters.
  final String affiliateToken;

  /// [Optional] Date of first contact, format: yyyy-mm-dd in GMT timezone.
  final String dateFirstContact;

  /// [Optional] Google Click Identifier to track source.
  final String gclidUrl;

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
}

/// Url parameters class
class UrlParameters extends UrlParametersModel {
  /// Initializes
  UrlParameters({
    String affiliateToken,
    String dateFirstContact,
    String gclidUrl,
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
  }) : super(
          affiliateToken: affiliateToken,
          dateFirstContact: dateFirstContact,
          gclidUrl: gclidUrl,
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
        );

  /// Creates an instance from JSON
  factory UrlParameters.fromJson(Map<String, dynamic> json) => UrlParameters(
        affiliateToken: json['affiliate_token'],
        dateFirstContact: json['date_first_contact'],
        gclidUrl: json['gclid_url'],
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['affiliate_token'] = affiliateToken;
    result['date_first_contact'] = dateFirstContact;
    result['gclid_url'] = gclidUrl;
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

    return result;
  }

  /// Creates a copy of instance with given parameters
  UrlParameters copyWith({
    String affiliateToken,
    String dateFirstContact,
    String gclidUrl,
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
  }) =>
      UrlParameters(
        affiliateToken: affiliateToken ?? this.affiliateToken,
        dateFirstContact: dateFirstContact ?? this.dateFirstContact,
        gclidUrl: gclidUrl ?? this.gclidUrl,
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
