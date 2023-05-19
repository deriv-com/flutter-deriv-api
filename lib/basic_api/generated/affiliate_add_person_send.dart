/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_add_person_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Affiliate add person request class.
class AffiliateAddPersonRequest extends Request {
  /// Initialize AffiliateAddPersonRequest.
  const AffiliateAddPersonRequest({
    required this.addressCity,
    required this.addressPostcode,
    required this.addressState,
    required this.addressStreet,
    this.affiliateAddPerson = true,
    this.bta,
    required this.citizenship,
    required this.country,
    required this.currency,
    required this.dateOfBirth,
    required this.firstName,
    required this.lastName,
    required this.nonPepDeclaration,
    required this.password,
    required this.phone,
    required this.promoteEu,
    required this.receiveMarketingEmails,
    required this.socialMediaUrl,
    required this.tncAccepted,
    required this.tncAffiliateAccepted,
    required this.verificationCode,
    required this.websiteUrl,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'affiliate_add_person',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AffiliateAddPersonRequest.fromJson(Map<String, dynamic> json) =>
      AffiliateAddPersonRequest(
        addressCity: json['address_city'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        addressStreet: json['address_street'] as String?,
        affiliateAddPerson: json['affiliate_add_person'] == null
            ? null
            : json['affiliate_add_person'] == 1,
        bta: json['bta'] as int?,
        citizenship: json['citizenship'] as String?,
        country: json['country'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        promoteEu: json['promote_eu'] as int?,
        receiveMarketingEmails: json['receive_marketing_emails'] as int?,
        socialMediaUrl: json['social_media_url'] as String?,
        tncAccepted: json['tnc_accepted'] as int?,
        tncAffiliateAccepted: json['tnc_affiliate_accepted'] as int?,
        verificationCode: json['verification_code'] as String?,
        websiteUrl: json['website_url'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// City name within 50 characters.
  final String? addressCity;

  /// Within 20 characters and may not contain '+'.
  final String? addressPostcode;

  /// Possible value receive from `states_list` call.
  final String? addressState;

  /// Within 70 characters, with no leading whitespaces and may contain letters/numbers and/or any of following characters '.,:;()@#/-
  final String? addressStreet;

  /// [Required] Must be `true`
  final bool? affiliateAddPerson;

  /// [Optional] BTA id field for master affiliate.
  final int? bta;

  /// Country of citizenship, 2-letter country code.
  final String? citizenship;

  /// Name of the country that currently reside, 2-letter country code.
  final String? country;

  /// Currency of affiliate that wants to work with.
  final String? currency;

  /// Birth date of affiliate user trying to register
  final String? dateOfBirth;

  /// The official first name of the affiliate. Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// The official last name of the affiliate. Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates).
  final int? nonPepDeclaration;

  /// Password for the affiliate account. (Accepts any printable ASCII character. Must be between 6-50 characters, and include numbers, lowercase and uppercase letters.).
  final String? password;

  /// Registered phone number of the affiliate. Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String? phone;

  /// Indicates client is going to promote its account to EU or not.
  final int? promoteEu;

  /// Indicates client has agreed to receive marketing emails or not.
  final int? receiveMarketingEmails;

  /// Social media URL of the affiliate trying to register.
  final String? socialMediaUrl;

  /// Indicates client has agreed to the terms and conditions.
  final int? tncAccepted;

  /// Indicates client has agreed to the terms and conditions for affiliates.
  final int? tncAffiliateAccepted;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;

  /// Social media URL of the affiliate trying to register.
  final String? websiteUrl;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address_city': addressCity,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'address_street': addressStreet,
        'affiliate_add_person': affiliateAddPerson == null
            ? null
            : affiliateAddPerson!
                ? 1
                : 0,
        'bta': bta,
        'citizenship': citizenship,
        'country': country,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'first_name': firstName,
        'last_name': lastName,
        'non_pep_declaration': nonPepDeclaration,
        'password': password,
        'phone': phone,
        'promote_eu': promoteEu,
        'receive_marketing_emails': receiveMarketingEmails,
        'social_media_url': socialMediaUrl,
        'tnc_accepted': tncAccepted,
        'tnc_affiliate_accepted': tncAffiliateAccepted,
        'verification_code': verificationCode,
        'website_url': websiteUrl,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateAddPersonRequest copyWith({
    String? addressCity,
    String? addressPostcode,
    String? addressState,
    String? addressStreet,
    bool? affiliateAddPerson,
    int? bta,
    String? citizenship,
    String? country,
    String? currency,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    int? nonPepDeclaration,
    String? password,
    String? phone,
    int? promoteEu,
    int? receiveMarketingEmails,
    String? socialMediaUrl,
    int? tncAccepted,
    int? tncAffiliateAccepted,
    String? verificationCode,
    String? websiteUrl,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AffiliateAddPersonRequest(
        addressCity: addressCity ?? this.addressCity,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        addressStreet: addressStreet ?? this.addressStreet,
        affiliateAddPerson: affiliateAddPerson ?? this.affiliateAddPerson,
        bta: bta ?? this.bta,
        citizenship: citizenship ?? this.citizenship,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        promoteEu: promoteEu ?? this.promoteEu,
        receiveMarketingEmails:
            receiveMarketingEmails ?? this.receiveMarketingEmails,
        socialMediaUrl: socialMediaUrl ?? this.socialMediaUrl,
        tncAccepted: tncAccepted ?? this.tncAccepted,
        tncAffiliateAccepted: tncAffiliateAccepted ?? this.tncAffiliateAccepted,
        verificationCode: verificationCode ?? this.verificationCode,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
