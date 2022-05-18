/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_account_add_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Affiliate account add request class.
class AffiliateAccountAddRequest extends Request {
  /// Initialize AffiliateAccountAddRequest.
  const AffiliateAccountAddRequest({
    required this.addressCity,
    required this.addressLine1,
    this.addressLine2,
    required this.addressPostcode,
    required this.addressState,
    this.affiliateAccountAdd = true,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.nonPepDeclaration,
    required this.password,
    required this.phone,
    required this.tncAccepted,
    required this.username,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'affiliate_account_add',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAddRequest.fromJson(Map<String, dynamic> json) =>
      AffiliateAccountAddRequest(
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        affiliateAccountAdd: json['affiliate_account_add'] == null
            ? null
            : json['affiliate_account_add'] == 1,
        country: json['country'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        tncAccepted: json['tnc_accepted'] as int?,
        username: json['username'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// City name within 50 characters.
  final String? addressCity;

  /// Within 70 characters, with no leading whitespaces and may contain letters/numbers and/or any of following characters '.,:;()@#/-
  final String? addressLine1;

  /// [Optional] Within 70 characters.
  final String? addressLine2;

  /// Within 20 characters and may not contain '+'.
  final String? addressPostcode;

  /// Possible value receive from `states_list` call.
  final String? addressState;

  /// [Required] Must be `true`
  final bool? affiliateAccountAdd;

  /// Country of legal citizenship, 2-letter country code.
  final String? country;

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

  /// Indicates client has agreed to the terms and conditions.
  final int? tncAccepted;

  /// Desired username for the affiliate account. Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? username;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'affiliate_account_add': affiliateAccountAdd == null
            ? null
            : affiliateAccountAdd!
                ? 1
                : 0,
        'country': country,
        'first_name': firstName,
        'last_name': lastName,
        'non_pep_declaration': nonPepDeclaration,
        'password': password,
        'phone': phone,
        'tnc_accepted': tncAccepted,
        'username': username,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateAccountAddRequest copyWith({
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    bool? affiliateAccountAdd,
    String? country,
    String? firstName,
    String? lastName,
    int? nonPepDeclaration,
    String? password,
    String? phone,
    int? tncAccepted,
    String? username,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AffiliateAccountAddRequest(
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        affiliateAccountAdd: affiliateAccountAdd ?? this.affiliateAccountAdd,
        country: country ?? this.country,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        tncAccepted: tncAccepted ?? this.tncAccepted,
        username: username ?? this.username,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
