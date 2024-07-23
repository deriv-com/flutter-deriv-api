// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate add company response model class.
abstract class AffiliateAddCompanyResponseModel {
  /// Initializes Affiliate add company response model class .
  const AffiliateAddCompanyResponseModel({
    this.affiliateAddCompany,
  });

  /// The information of the affiliate user trying to register.
  final AffiliateAddCompany? affiliateAddCompany;
}

/// Affiliate add company response class.
class AffiliateAddCompanyResponse extends AffiliateAddCompanyResponseModel {
  /// Initializes Affiliate add company response class.
  const AffiliateAddCompanyResponse({
    super.affiliateAddCompany,
  });

  /// Creates an instance from JSON.
  factory AffiliateAddCompanyResponse.fromJson(
    dynamic affiliateAddCompanyJson,
  ) =>
      AffiliateAddCompanyResponse(
        affiliateAddCompany: affiliateAddCompanyJson == null
            ? null
            : AffiliateAddCompany.fromJson(affiliateAddCompanyJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (affiliateAddCompany != null) {
      resultMap['affiliate_add_company'] = affiliateAddCompany!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAddCompanyResponse copyWith({
    AffiliateAddCompany? affiliateAddCompany,
  }) =>
      AffiliateAddCompanyResponse(
        affiliateAddCompany: affiliateAddCompany ?? this.affiliateAddCompany,
      );
}

/// Affiliate add company model class.
abstract class AffiliateAddCompanyModel {
  /// Initializes Affiliate add company model class .
  const AffiliateAddCompanyModel({
    required this.real,
    required this.demo,
    this.addressPostcode,
    this.addressState,
    this.addressStreet,
    this.affiliateId,
    this.bta,
    this.companyName,
    this.companyRegisterNumber,
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

  /// Postal code of the address.
  final String? addressPostcode;

  /// State / Region of the address.
  final String? addressState;

  /// First line of address.
  final String? addressStreet;

  /// Affiliate ID from CellXperts for the created affiliate
  final String? affiliateId;

  /// [Optional] BTA id field for master affiliate.
  final int? bta;

  /// Name of the company trying to register.
  final String? companyName;

  /// Company registration number.
  final String? companyRegisterNumber;

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

/// Affiliate add company class.
class AffiliateAddCompany extends AffiliateAddCompanyModel {
  /// Initializes Affiliate add company class.
  const AffiliateAddCompany({
    required super.demo,
    required super.real,
    super.addressPostcode,
    super.addressState,
    super.addressStreet,
    super.affiliateId,
    super.bta,
    super.companyName,
    super.companyRegisterNumber,
    super.country,
    super.dateOfBirth,
    super.firstName,
    super.lastName,
    super.nonPepDeclaration,
    super.phone,
    super.tncAccepted,
    super.verificationCode,
  });

  /// Creates an instance from JSON.
  factory AffiliateAddCompany.fromJson(Map<String, dynamic> json) =>
      AffiliateAddCompany(
        demo: json['demo'],
        real: json['real'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        addressStreet: json['address_street'],
        affiliateId: json['affiliate_id'],
        bta: json['bta'],
        companyName: json['company_name'],
        companyRegisterNumber: json['company_register_number'],
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
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['address_street'] = addressStreet;
    resultMap['affiliate_id'] = affiliateId;
    resultMap['bta'] = bta;
    resultMap['company_name'] = companyName;
    resultMap['company_register_number'] = companyRegisterNumber;
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
  AffiliateAddCompany copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
    String? addressPostcode,
    String? addressState,
    String? addressStreet,
    String? affiliateId,
    int? bta,
    String? companyName,
    String? companyRegisterNumber,
    String? country,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) =>
      AffiliateAddCompany(
        demo: demo ?? this.demo,
        real: real ?? this.real,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        addressStreet: addressStreet ?? this.addressStreet,
        affiliateId: affiliateId ?? this.affiliateId,
        bta: bta ?? this.bta,
        companyName: companyName ?? this.companyName,
        companyRegisterNumber:
            companyRegisterNumber ?? this.companyRegisterNumber,
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
