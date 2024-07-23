/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_register_person_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Affiliate register person request class.
class AffiliateRegisterPersonRequest extends Request {
  /// Initialize AffiliateRegisterPersonRequest.
  const AffiliateRegisterPersonRequest({
    required this.addressCity,
    required this.addressPostcode,
    required this.addressState,
    required this.addressStreet,
    this.affiliateRegisterPerson = true,
    required this.citizenship,
    required this.commissionPlan,
    required this.companyName,
    required this.companyRegistrationNumber,
    required this.country,
    required this.currency,
    required this.dateOfBirth,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.loginid,
    required this.nonPepDeclaration,
    required this.over18Declaration,
    required this.password,
    required this.phone,
    required this.phoneCode,
    required this.promoteEu,
    required this.receiveMarketingEmails,
    required this.socialMediaUrl,
    required this.tncAccepted,
    required this.tncAffiliateAccepted,
    required this.typeOfAccount,
    required this.userName,
    required this.websiteUrl,
    required this.whatsappNumber,
    required this.whatsappNumberPhoneCode,
    super.msgType = 'affiliate_register_person',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AffiliateRegisterPersonRequest.fromJson(Map<String, dynamic> json) =>
      AffiliateRegisterPersonRequest(
        addressCity: json['address_city'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        addressStreet: json['address_street'] as String?,
        affiliateRegisterPerson: json['affiliate_register_person'] == null
            ? null
            : json['affiliate_register_person'] == 1,
        citizenship: json['citizenship'] as String?,
        commissionPlan: json['commission_plan'] as int?,
        companyName: json['company_name'] as String?,
        companyRegistrationNumber:
            json['company_registration_number'] as String?,
        country: json['country'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        email: json['email'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        loginid: json['loginid'] as String?,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        over18Declaration: json['over_18_declaration'] == null
            ? null
            : json['over_18_declaration'] == 1,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        phoneCode: json['phone_code'] as String?,
        promoteEu: json['promote_eu'] as int?,
        receiveMarketingEmails: json['receive_marketing_emails'] as int?,
        socialMediaUrl: json['social_media_url'] as String?,
        tncAccepted: json['tnc_accepted'] as int?,
        tncAffiliateAccepted: json['tnc_affiliate_accepted'] as int?,
        typeOfAccount: json['type_of_account'] as int?,
        userName: json['user_name'] as String?,
        websiteUrl: json['website_url'] as String?,
        whatsappNumber: json['whatsapp_number'] as String?,
        whatsappNumberPhoneCode: json['whatsapp_number_phoneCode'] as String?,
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
  final bool? affiliateRegisterPerson;

  /// Name of the country that the user is citizen of, 2-letter country code.
  final String? citizenship;

  /// Commission plan selected by affiliate 2 RevShare, 4. Turnover
  final int? commissionPlan;

  /// Name of the company.
  final String? companyName;

  /// Registration number of the company
  final String? companyRegistrationNumber;

  /// Name of the country that currently reside, 2-letter country code.
  final String? country;

  /// Currency of affiliate that wants to work with.
  final String? currency;

  /// Birth date of affiliate user trying to register
  final String? dateOfBirth;

  /// Email address
  final String? email;

  /// The official first name of the affiliate. Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// The official last name of the affiliate. Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates).
  final int? nonPepDeclaration;

  /// Indicates client's self-declaration of being over `true`8 in age
  final bool? over18Declaration;

  /// Password for the affiliate account. (Accepts any printable ASCII character. Must be between 6-50 characters, and include numbers, lowercase and uppercase letters.).
  final String? password;

  /// Registered phone number of the affiliate. Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String? phone;

  /// Phone code without the starting + sign
  final String? phoneCode;

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

  /// Account type select 1 business, 2 individual
  final int? typeOfAccount;

  /// Username of affiliate, will be unique everytime
  final String? userName;

  /// Social media URL of the affiliate trying to register.
  final String? websiteUrl;

  /// Whatsapp phone number of the affiliate. Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String? whatsappNumber;

  /// Whatsapp code without the starting + sign
  final String? whatsappNumberPhoneCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address_city': addressCity,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'address_street': addressStreet,
        'affiliate_register_person': affiliateRegisterPerson == null
            ? null
            : affiliateRegisterPerson!
                ? 1
                : 0,
        'citizenship': citizenship,
        'commission_plan': commissionPlan,
        'company_name': companyName,
        'company_registration_number': companyRegistrationNumber,
        'country': country,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'loginid': loginid,
        'non_pep_declaration': nonPepDeclaration,
        'over_18_declaration': over18Declaration == null
            ? null
            : over18Declaration!
                ? 1
                : 0,
        'password': password,
        'phone': phone,
        'phone_code': phoneCode,
        'promote_eu': promoteEu,
        'receive_marketing_emails': receiveMarketingEmails,
        'social_media_url': socialMediaUrl,
        'tnc_accepted': tncAccepted,
        'tnc_affiliate_accepted': tncAffiliateAccepted,
        'type_of_account': typeOfAccount,
        'user_name': userName,
        'website_url': websiteUrl,
        'whatsapp_number': whatsappNumber,
        'whatsapp_number_phoneCode': whatsappNumberPhoneCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateRegisterPersonRequest copyWith({
    String? addressCity,
    String? addressPostcode,
    String? addressState,
    String? addressStreet,
    bool? affiliateRegisterPerson,
    String? citizenship,
    int? commissionPlan,
    String? companyName,
    String? companyRegistrationNumber,
    String? country,
    String? currency,
    String? dateOfBirth,
    String? email,
    String? firstName,
    String? lastName,
    String? loginid,
    int? nonPepDeclaration,
    bool? over18Declaration,
    String? password,
    String? phone,
    String? phoneCode,
    int? promoteEu,
    int? receiveMarketingEmails,
    String? socialMediaUrl,
    int? tncAccepted,
    int? tncAffiliateAccepted,
    int? typeOfAccount,
    String? userName,
    String? websiteUrl,
    String? whatsappNumber,
    String? whatsappNumberPhoneCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AffiliateRegisterPersonRequest(
        addressCity: addressCity ?? this.addressCity,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        addressStreet: addressStreet ?? this.addressStreet,
        affiliateRegisterPerson:
            affiliateRegisterPerson ?? this.affiliateRegisterPerson,
        citizenship: citizenship ?? this.citizenship,
        commissionPlan: commissionPlan ?? this.commissionPlan,
        companyName: companyName ?? this.companyName,
        companyRegistrationNumber:
            companyRegistrationNumber ?? this.companyRegistrationNumber,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        over18Declaration: over18Declaration ?? this.over18Declaration,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        phoneCode: phoneCode ?? this.phoneCode,
        promoteEu: promoteEu ?? this.promoteEu,
        receiveMarketingEmails:
            receiveMarketingEmails ?? this.receiveMarketingEmails,
        socialMediaUrl: socialMediaUrl ?? this.socialMediaUrl,
        tncAccepted: tncAccepted ?? this.tncAccepted,
        tncAffiliateAccepted: tncAffiliateAccepted ?? this.tncAffiliateAccepted,
        typeOfAccount: typeOfAccount ?? this.typeOfAccount,
        userName: userName ?? this.userName,
        websiteUrl: websiteUrl ?? this.websiteUrl,
        whatsappNumber: whatsappNumber ?? this.whatsappNumber,
        whatsappNumberPhoneCode:
            whatsappNumberPhoneCode ?? this.whatsappNumberPhoneCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
