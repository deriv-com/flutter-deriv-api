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
    required this.username,
    required this.tncAccepted,
    required this.phone,
    required this.nonPepDeclaration,
    required this.lastName,
    required this.firstName,
    required this.country,
    required this.affiliateId,
    required this.addressState,
    required this.addressPostcode,
    required this.addressLine1,
    required this.addressCity,
    this.addressLine2,
  });

  /// Username of the created affiliate.
  final String username;

  /// Terms and conditions acceptance status of the created affiliate.
  final bool tncAccepted;

  /// Registered phone number of the created affiliate.
  final String phone;

  /// PEP declaration status of the created affiliate.
  final bool nonPepDeclaration;

  /// Last name of the created affiliate
  final String lastName;

  /// First name of the created affiliate.
  final String firstName;

  /// Registered country of the created affiliate.
  final String country;

  /// Affiliate ID from CellXperts for the created affiliate
  final String affiliateId;

  /// State / Region of the address.
  final String addressState;

  /// Postal code of the address.
  final String addressPostcode;

  /// First line of address.
  final String addressLine1;

  /// City name
  final String addressCity;

  /// Second line of address.
  final String? addressLine2;
}

/// Affiliate account add class.
class AffiliateAccountAdd extends AffiliateAccountAddModel {
  /// Initializes Affiliate account add class.
  const AffiliateAccountAdd({
    required String addressCity,
    required String addressLine1,
    required String addressPostcode,
    required String addressState,
    required String affiliateId,
    required String country,
    required String firstName,
    required String lastName,
    required bool nonPepDeclaration,
    required String phone,
    required bool tncAccepted,
    required String username,
    String? addressLine2,
  }) : super(
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressPostcode: addressPostcode,
          addressState: addressState,
          affiliateId: affiliateId,
          country: country,
          firstName: firstName,
          lastName: lastName,
          nonPepDeclaration: nonPepDeclaration,
          phone: phone,
          tncAccepted: tncAccepted,
          username: username,
          addressLine2: addressLine2,
        );

  /// Creates an instance from JSON.
  factory AffiliateAccountAdd.fromJson(Map<String, dynamic> json) =>
      AffiliateAccountAdd(
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        affiliateId: json['affiliate_id'],
        country: json['country'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        nonPepDeclaration: getBool(json['non_pep_declaration'])!,
        phone: json['phone'],
        tncAccepted: getBool(json['tnc_accepted'])!,
        username: json['username'],
        addressLine2: json['address_line_2'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address_city'] = addressCity;
    resultMap['address_line_1'] = addressLine1;
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['affiliate_id'] = affiliateId;
    resultMap['country'] = country;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['non_pep_declaration'] = nonPepDeclaration;
    resultMap['phone'] = phone;
    resultMap['tnc_accepted'] = tncAccepted;
    resultMap['username'] = username;
    resultMap['address_line_2'] = addressLine2;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateAccountAdd copyWith({
    required String addressCity,
    required String addressLine1,
    required String addressPostcode,
    required String addressState,
    required String affiliateId,
    required String country,
    required String firstName,
    required String lastName,
    required bool nonPepDeclaration,
    required String phone,
    required bool tncAccepted,
    required String username,
    String? addressLine2,
  }) =>
      AffiliateAccountAdd(
        addressCity: addressCity,
        addressLine1: addressLine1,
        addressPostcode: addressPostcode,
        addressState: addressState,
        affiliateId: affiliateId,
        country: country,
        firstName: firstName,
        lastName: lastName,
        nonPepDeclaration: nonPepDeclaration,
        phone: phone,
        tncAccepted: tncAccepted,
        username: username,
        addressLine2: addressLine2 ?? this.addressLine2,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
