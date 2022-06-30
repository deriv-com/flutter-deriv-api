// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate account add response model class.
abstract class AffiliateAccountAddResponseModel extends Equatable {
  /// Initializes Affiliate account add response model class .
  const AffiliateAccountAddResponseModel({
    this.affiliateAccountAdd,
  });

  /// The information of the created affiliate user.
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Affiliate account add model class.
abstract class AffiliateAccountAddModel extends Equatable {
  /// Initializes Affiliate account add model class .
  const AffiliateAccountAddModel({
    required this.affiliateId,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.country,
    this.firstName,
    this.lastName,
    this.nonPepDeclaration,
    this.phone,
    this.tncAccepted,
    this.verificationCode,
  });

  /// Affiliate ID from CellXperts for the created affiliate
  final String affiliateId;

  /// City name
  final String? addressCity;

  /// First line of address.
  final String? addressLine1;

  /// Second line of address.
  final String? addressLine2;

  /// Postal code of the address.
  final String? addressPostcode;

  /// State / Region of the address.
  final String? addressState;

  /// Registered country of the created affiliate.
  final String? country;

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
    required String affiliateId,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? country,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) : super(
          affiliateId: affiliateId,
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          country: country,
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
        affiliateId: json['affiliate_id'],
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        country: json['country'],
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

    resultMap['affiliate_id'] = affiliateId;
    resultMap['address_city'] = addressCity;
    resultMap['address_line_1'] = addressLine1;
    resultMap['address_line_2'] = addressLine2;
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['country'] = country;
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
    String? affiliateId,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? country,
    String? firstName,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    bool? tncAccepted,
    String? verificationCode,
  }) =>
      AffiliateAccountAdd(
        affiliateId: affiliateId ?? this.affiliateId,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        country: country ?? this.country,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        tncAccepted: tncAccepted ?? this.tncAccepted,
        verificationCode: verificationCode ?? this.verificationCode,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
