/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_wallet_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// New account wallet request class.
class NewAccountWalletRequest extends Request {
  /// Initialize NewAccountWalletRequest.
  const NewAccountWalletRequest({
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.currency,
    this.dateOfBirth,
    this.firstName,
    this.lastName,
    this.newAccountWallet = true,
    this.nonPepDeclaration,
    required this.paymentMethod,
    this.phone,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'new_account_wallet',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory NewAccountWalletRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountWalletRequest(
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        newAccountWallet: json['new_account_wallet'] == null
            ? null
            : json['new_account_wallet'] == 1,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        paymentMethod: json['payment_method'] as String?,
        phone: json['phone'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Within 35 characters.
  final String? addressCity;

  /// [Optional] Mailing address.
  final String? addressLine1;

  /// [Optional] Within 70 characters.
  final String? addressLine2;

  /// [Optional] Within 20 characters and may not contain '+'.
  final String? addressPostcode;

  /// [Optional] Possible value receive from `states_list` call.
  final String? addressState;

  /// [Optional] To set currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? currency;

  /// [Optional] Date of birth format: `yyyy-mm-dd`.
  final String? dateOfBirth;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// Must be `true`
  final bool? newAccountWallet;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates).
  final int? nonPepDeclaration;

  /// To set method which is used to transfer to/from wallet.
  final String? paymentMethod;

  /// [Optional] Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String? phone;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'first_name': firstName,
        'last_name': lastName,
        'new_account_wallet': newAccountWallet == null
            ? null
            : newAccountWallet!
                ? 1
                : 0,
        'non_pep_declaration': nonPepDeclaration,
        'payment_method': paymentMethod,
        'phone': phone,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountWalletRequest copyWith({
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? currency,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? newAccountWallet,
    int? nonPepDeclaration,
    String? paymentMethod,
    String? phone,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NewAccountWalletRequest(
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        newAccountWallet: newAccountWallet ?? this.newAccountWallet,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        phone: phone ?? this.phone,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
