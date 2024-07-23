// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate account add response model class.
abstract class AffiliateAccountAddResponseModel {
  /// Initializes Affiliate account add response model class .
  const AffiliateAccountAddResponseModel({
    this.affiliateAccountAdd,
  });

  /// The information of the affiliate user trying to register.
  final AffiliateAccountAdd? affiliateAccountAdd;
}

/// Affiliate account add response class.
class AffiliateAccountAddResponse extends AffiliateAccountAddResponseModel {
  /// Initializes Affiliate account add response class.
  const AffiliateAccountAddResponse({
    AffiliateAccountAdd? affiliateAccountAdd,
  }) : super(
          affiliateAccountAdd: affiliateAccountAdd,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAddResponse.fromJson(
    dynamic affiliateAccountAddJson,
  ) =>
      AffiliateAccountAddResponse(
        affiliateAccountAdd: affiliateAccountAddJson == null
            ? null
            : AffiliateAccountAdd.fromJson(affiliateAccountAddJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (affiliateAccountAdd != null) {
      resultMap['affiliate_account_add'] = affiliateAccountAdd!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAccountAddResponse copyWith({
    AffiliateAccountAdd? affiliateAccountAdd,
  }) =>
      AffiliateAccountAddResponse(
        affiliateAccountAdd: affiliateAccountAdd ?? this.affiliateAccountAdd,
      );
}

/// Affiliate account add model class.
abstract class AffiliateAccountAddModel {
  /// Initializes Affiliate account add model class .
  const AffiliateAccountAddModel({
    required this.real,
    required this.demo,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.affiliateId,
    this.country,
    this.dateOfBirth,
    this.firstName,
    this.lastName,
    this.nonPepDeclaration,
    this.phone,
    this.tncAccepted,
    this.verificationCode,
  });

  /// Real created account details
  final Map<String, dynamic> real;

  /// Demo(VRTC) created account details
  final Map<String, dynamic> demo;

  /// First line of address.
  final String? addressLine1;

  /// Second line of address.
  final String? addressLine2;

  /// Postal code of the address.
  final String? addressPostcode;

  /// State / Region of the address.
  final String? addressState;

  /// Affiliate ID from CellXperts for the created affiliate
  final String? affiliateId;

  /// Registered country of the created affiliate.
  final String? country;

  /// Birth date of user trying to register
  final String? dateOfBirth;

  /// First name of the created affiliate.
  final String? firstName;

  /// Last name of the created affiliate
  final String? lastName;

  /// PEP declaration status of the created affiliate.
  final bool? nonPepDeclaration;

  /// Registered phone number of the created affiliate.
  final String? phone;

  /// Terms and conditions acceptance status of the created affiliate.
  final bool? tncAccepted;

  /// Email verification code (received from a `verify_email` call, which must be done first).
  final String? verificationCode;
}

/// Affiliate account add class.
class AffiliateAccountAdd extends AffiliateAccountAddModel {
  /// Initializes Affiliate account add class.
  const AffiliateAccountAdd({
    required Map<String, dynamic> demo,
    required Map<String, dynamic> real,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? affiliateId,
    String? country,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) : super(
          demo: demo,
          real: real,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          affiliateId: affiliateId,
          country: country,
          dateOfBirth: dateOfBirth,
          firstName: firstName,
          lastName: lastName,
          nonPepDeclaration: nonPepDeclaration,
          phone: phone,
          tncAccepted: tncAccepted,
          verificationCode: verificationCode,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAdd.fromJson(Map<String, dynamic> json) =>
      AffiliateAccountAdd(
        demo: json['demo'],
        real: json['real'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        affiliateId: json['affiliate_id'],
        country: json['country'],
        dateOfBirth: json['date_of_birth'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        nonPepDeclaration: getBool(json['non_pep_declaration']),
        phone: json['phone'],
        tncAccepted: getBool(json['tnc_accepted']),
        verificationCode: json['verification_code'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['demo'] = demo;
    resultMap['real'] = real;
    resultMap['address_line_1'] = addressLine1;
    resultMap['address_line_2'] = addressLine2;
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['affiliate_id'] = affiliateId;
    resultMap['country'] = country;
    resultMap['date_of_birth'] = dateOfBirth;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['non_pep_declaration'] = nonPepDeclaration;
    resultMap['phone'] = phone;
    resultMap['tnc_accepted'] = tncAccepted;
    resultMap['verification_code'] = verificationCode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAccountAdd copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? affiliateId,
    String? country,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) =>
      AffiliateAccountAdd(
        demo: demo ?? this.demo,
        real: real ?? this.real,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        affiliateId: affiliateId ?? this.affiliateId,
        country: country ?? this.country,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        tncAccepted: tncAccepted ?? this.tncAccepted,
        verificationCode: verificationCode ?? this.verificationCode,
      );
}
