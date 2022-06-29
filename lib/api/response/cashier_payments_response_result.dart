// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Cashier payments response model class.
abstract class CashierPaymentsResponseModel extends Equatable {
  /// Initializes Cashier payments response model class .
  const CashierPaymentsResponseModel({
    this.cashierPayments,
    this.subscription,
  });

  /// List of cashier transactions.
  final CashierPayments? cashierPayments;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Cashier payments response class.
class CashierPaymentsResponse extends CashierPaymentsResponseModel {
  /// Initializes Cashier payments response class.
  const CashierPaymentsResponse({
    CashierPayments? cashierPayments,
    Subscription? subscription,
  }) : super(
          cashierPayments: cashierPayments,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory CashierPaymentsResponse.fromJson(
    dynamic cashierPaymentsJson,
    dynamic subscriptionJson,
  ) =>
      CashierPaymentsResponse(
        cashierPayments: cashierPaymentsJson == null
            ? null
            : CashierPayments.fromJson(cashierPaymentsJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (cashierPayments != null) {
      resultMap['cashier_payments'] = cashierPayments!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierPaymentsResponse copyWith({
    CashierPayments? cashierPayments,
    Subscription? subscription,
  }) =>
      CashierPaymentsResponse(
        cashierPayments: cashierPayments ?? this.cashierPayments,
        subscription: subscription ?? this.subscription,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// StatusCodeEnum mapper.
final Map<String, StatusCodeEnum> statusCodeEnumMapper =
    <String, StatusCodeEnum>{
  "CANCELLED": StatusCodeEnum.cancelled,
  "CONFIRMED": StatusCodeEnum.confirmed,
  "ERROR": StatusCodeEnum.error,
  "LOCKED": StatusCodeEnum.locked,
  "PENDING": StatusCodeEnum.pending,
  "PERFORMING_BLOCKCHAIN_TXN": StatusCodeEnum.performingBlockchainTxn,
  "PROCESSING": StatusCodeEnum.processing,
  "REJECTED": StatusCodeEnum.rejected,
  "SENT": StatusCodeEnum.sent,
  "VERIFIED": StatusCodeEnum.verified,
};

/// StatusCode Enum.
enum StatusCodeEnum {
  /// CANCELLED.
  cancelled,

  /// CONFIRMED.
  confirmed,

  /// ERROR.
  error,

  /// LOCKED.
  locked,

  /// PENDING.
  pending,

  /// PERFORMING_BLOCKCHAIN_TXN.
  performingBlockchainTxn,

  /// PROCESSING.
  processing,

  /// REJECTED.
  rejected,

  /// SENT.
  sent,

  /// VERIFIED.
  verified,
}

/// TransactionTypeEnum mapper.
final Map<String, TransactionTypeEnum> transactionTypeEnumMapper =
    <String, TransactionTypeEnum>{
  "deposit": TransactionTypeEnum.deposit,
  "withdrawal": TransactionTypeEnum.withdrawal,
};

/// TransactionType Enum.
enum TransactionTypeEnum {
  /// deposit.
  deposit,

  /// withdrawal.
  withdrawal,
}
/// Cashier payments model class.
abstract class CashierPaymentsModel extends Equatable {
  /// Initializes Cashier payments model class .
  const CashierPaymentsModel({
    this.crypto,
  });

  /// Response for provider `crypto'.
  final List<CryptoItem>? crypto;
}

/// Cashier payments class.
class CashierPayments extends CashierPaymentsModel {
  /// Initializes Cashier payments class.
  const CashierPayments({
    List<CryptoItem>? crypto,
  }) : super(
          crypto: crypto,
        );

  /// Creates an instance from JSON.
  factory CashierPayments.fromJson(Map<String, dynamic> json) =>
      CashierPayments(
        crypto: json['crypto'] == null
            ? null
            : List<CryptoItem>.from(
                json['crypto']?.map(
                  (dynamic item) => CryptoItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (crypto != null) {
      resultMap['crypto'] = crypto!
          .map<dynamic>(
            (CryptoItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierPayments copyWith({
    List<CryptoItem>? crypto,
  }) =>
      CashierPayments(
        crypto: crypto ?? this.crypto,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Crypto item model class.
abstract class CryptoItemModel extends Equatable {
  /// Initializes Crypto item model class .
  const CryptoItemModel({
    required this.transactionType,
    required this.statusMessage,
    required this.statusCode,
    required this.id,
    required this.addressUrl,
    required this.addressHash,
    this.amount,
    this.isValidToCancel,
    this.submitDate,
    this.transactionHash,
    this.transactionUrl,
  });

  /// The type of the transaction.
  final TransactionTypeEnum transactionType;

  /// The status message of the transaction.
  final String statusMessage;

  /// The status code of the transaction. Possible values for **deposit:** `PENDING|CONFIRMED|ERROR`, possible values for **withdrawal:** `LOCKED|VERIFIED|REJECTED|PERFORMING_BLOCKCHAIN_TXN|PROCESSING|SENT|ERROR|CANCELLED`.
  final StatusCodeEnum statusCode;

  /// The unique identifier for the transaction.
  final String id;

  /// The URL of the address on blockchain.
  final String addressUrl;

  /// The destination crypto address.
  final String addressHash;

  /// [Optional] The transaction amount. Not present when deposit transaction still unconfirmed.
  final double? amount;

  /// [Optional] Boolean value: `true` or `false`, indicating whether the transaction can be cancelled. Only applicable for `withdrawal` transactions.
  final bool? isValidToCancel;

  /// The epoch of the transaction date.
  final DateTime? submitDate;

  /// [Optional] The transaction hash when available.
  final String? transactionHash;

  /// [Optional] The URL of the transaction on blockchain if `transaction_hash` is available.
  final String? transactionUrl;
}

/// Crypto item class.
class CryptoItem extends CryptoItemModel {
  /// Initializes Crypto item class.
  const CryptoItem({
    required String addressHash,
    required String addressUrl,
    required String id,
    required StatusCodeEnum statusCode,
    required String statusMessage,
    required TransactionTypeEnum transactionType,
    double? amount,
    bool? isValidToCancel,
    DateTime? submitDate,
    String? transactionHash,
    String? transactionUrl,
  }) : super(
          addressHash: addressHash,
          addressUrl: addressUrl,
          id: id,
          statusCode: statusCode,
          statusMessage: statusMessage,
          transactionType: transactionType,
          amount: amount,
          isValidToCancel: isValidToCancel,
          submitDate: submitDate,
          transactionHash: transactionHash,
          transactionUrl: transactionUrl,
        );

  /// Creates an instance from JSON.
  factory CryptoItem.fromJson(Map<String, dynamic> json) => CryptoItem(
        addressHash: json['address_hash'],
        addressUrl: json['address_url'],
        id: json['id'],
        statusCode: statusCodeEnumMapper[json['status_code']]!,
        statusMessage: json['status_message'],
        transactionType: transactionTypeEnumMapper[json['transaction_type']]!,
        amount: getDouble(json['amount']),
        isValidToCancel: getBool(json['is_valid_to_cancel']),
        submitDate: getDateTime(json['submit_date']),
        transactionHash: json['transaction_hash'],
        transactionUrl: json['transaction_url'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address_hash'] = addressHash;
    resultMap['address_url'] = addressUrl;
    resultMap['id'] = id;
    resultMap['status_code'] = statusCodeEnumMapper.entries
        .firstWhere((MapEntry<String, StatusCodeEnum> entry) =>
            entry.value == statusCode)
        .key;
    resultMap['status_message'] = statusMessage;
    resultMap['transaction_type'] = transactionTypeEnumMapper.entries
        .firstWhere((MapEntry<String, TransactionTypeEnum> entry) =>
            entry.value == transactionType)
        .key;
    resultMap['amount'] = amount;
    resultMap['is_valid_to_cancel'] = isValidToCancel;
    resultMap['submit_date'] = getSecondsSinceEpochDateTime(submitDate);
    resultMap['transaction_hash'] = transactionHash;
    resultMap['transaction_url'] = transactionUrl;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoItem copyWith({
    String? addressHash,
    String? addressUrl,
    String? id,
    StatusCodeEnum? statusCode,
    String? statusMessage,
    TransactionTypeEnum? transactionType,
    double? amount,
    bool? isValidToCancel,
    DateTime? submitDate,
    String? transactionHash,
    String? transactionUrl,
  }) =>
      CryptoItem(
        addressHash: addressHash ?? this.addressHash,
        addressUrl: addressUrl ?? this.addressUrl,
        id: id ?? this.id,
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        transactionType: transactionType ?? this.transactionType,
        amount: amount ?? this.amount,
        isValidToCancel: isValidToCancel ?? this.isValidToCancel,
        submitDate: submitDate ?? this.submitDate,
        transactionHash: transactionHash ?? this.transactionHash,
        transactionUrl: transactionUrl ?? this.transactionUrl,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Subscription model class.
abstract class SubscriptionModel extends Equatable {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
