// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate add person response model class.
abstract class AffiliateAddPersonResponseModel {
  /// Initializes Affiliate add person response model class .
  const AffiliateAddPersonResponseModel({
    this.affiliateAddPerson,
  });

  /// The information of the affiliate user trying to register.
  final AffiliateAddPerson? affiliateAddPerson;
}

/// Affiliate add person response class.
class AffiliateAddPersonResponse extends AffiliateAddPersonResponseModel {
  /// Initializes Affiliate add person response class.
  const AffiliateAddPersonResponse({
    super.affiliateAddPerson,
  });

  /// Creates an instance from JSON.
  factory AffiliateAddPersonResponse.fromJson(
    dynamic affiliateAddPersonJson,
  ) =>
      AffiliateAddPersonResponse(
        affiliateAddPerson: affiliateAddPersonJson == null
            ? null
            : AffiliateAddPerson.fromJson(affiliateAddPersonJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (affiliateAddPerson != null) {
      resultMap['affiliate_add_person'] = affiliateAddPerson!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAddPersonResponse copyWith({
    AffiliateAddPerson? affiliateAddPerson,
  }) =>
      AffiliateAddPersonResponse(
        affiliateAddPerson: affiliateAddPerson ?? this.affiliateAddPerson,
      );
}
/// Affiliate add person model class.
abstract class AffiliateAddPersonModel {
  /// Initializes Affiliate add person model class .
  const AffiliateAddPersonModel({
    required this.real,
    required this.demo,
    this.addressPostcode,
    this.addressState,
    this.addressStreet,
    this.affiliateId,
    this.bta,
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

/// Affiliate add person class.
class AffiliateAddPerson extends AffiliateAddPersonModel {
  /// Initializes Affiliate add person class.
  const AffiliateAddPerson({
    required super.demo,
    required super.real,
    super.addressPostcode,
    super.addressState,
    super.addressStreet,
    super.affiliateId,
    super.bta,
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
  factory AffiliateAddPerson.fromJson(Map<String, dynamic> json) =>
      AffiliateAddPerson(
        demo: json['demo'],
        real: json['real'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        addressStreet: json['address_street'],
        affiliateId: json['affiliate_id'],
        bta: json['bta'],
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
  AffiliateAddPerson copyWith({
    Map<String, dynamic>? demo,
    Map<String, dynamic>? real,
    String? addressPostcode,
    String? addressState,
    String? addressStreet,
    String? affiliateId,
    int? bta,
    String? country,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) =>
      AffiliateAddPerson(
        demo: demo ?? this.demo,
        real: real ?? this.real,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        addressStreet: addressStreet ?? this.addressStreet,
        affiliateId: affiliateId ?? this.affiliateId,
        bta: bta ?? this.bta,
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
