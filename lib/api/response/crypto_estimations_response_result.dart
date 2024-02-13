// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Crypto estimations response model class.
abstract class CryptoEstimationsResponseModel {
  /// Initializes Crypto estimations response model class .
  const CryptoEstimationsResponseModel({
    this.cryptoEstimations,
    this.subscription,
  });

  /// Cryptocurrency estimations. E.g. Withdrawal fee estimations.
  final Map<String, CryptoEstimationsProperty>? cryptoEstimations;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Crypto estimations response class.
class CryptoEstimationsResponse extends CryptoEstimationsResponseModel {
  /// Initializes Crypto estimations response class.
  const CryptoEstimationsResponse({
    super.cryptoEstimations,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory CryptoEstimationsResponse.fromJson(
    dynamic cryptoEstimationsJson,
    dynamic subscriptionJson,
  ) =>
      CryptoEstimationsResponse(
        cryptoEstimations: cryptoEstimationsJson == null
            ? null
            : Map<String, CryptoEstimationsProperty>.fromEntries(
                cryptoEstimationsJson.entries.map<
                        MapEntry<String, CryptoEstimationsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CryptoEstimationsProperty>(entry.key,
                            CryptoEstimationsProperty.fromJson(entry.value)))),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['crypto_estimations'] = cryptoEstimations;
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoEstimationsResponse copyWith({
    Map<String, CryptoEstimationsProperty>? cryptoEstimations,
    Subscription? subscription,
  }) =>
      CryptoEstimationsResponse(
        cryptoEstimations: cryptoEstimations ?? this.cryptoEstimations,
        subscription: subscription ?? this.subscription,
      );
}
/// Crypto estimations property model class.
abstract class CryptoEstimationsPropertyModel {
  /// Initializes Crypto estimations property model class .
  const CryptoEstimationsPropertyModel({
    this.withdrawalFee,
  });

  /// Estimated fee for crypto withdrawal calculated based on the current network conditions.
  final WithdrawalFee? withdrawalFee;
}

/// Crypto estimations property class.
class CryptoEstimationsProperty extends CryptoEstimationsPropertyModel {
  /// Initializes Crypto estimations property class.
  const CryptoEstimationsProperty({
    super.withdrawalFee,
  });

  /// Creates an instance from JSON.
  factory CryptoEstimationsProperty.fromJson(Map<String, dynamic> json) =>
      CryptoEstimationsProperty(
        withdrawalFee: json['withdrawal_fee'] == null
            ? null
            : WithdrawalFee.fromJson(json['withdrawal_fee']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (withdrawalFee != null) {
      resultMap['withdrawal_fee'] = withdrawalFee!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoEstimationsProperty copyWith({
    WithdrawalFee? withdrawalFee,
  }) =>
      CryptoEstimationsProperty(
        withdrawalFee: withdrawalFee ?? this.withdrawalFee,
      );
}
/// Withdrawal fee model class.
abstract class WithdrawalFeeModel {
  /// Initializes Withdrawal fee model class .
  const WithdrawalFeeModel({
    this.expiryTime,
    this.uniqueId,
    this.value,
  });

  /// Expiry time for the estimated fee in epoch.
  final DateTime? expiryTime;

  /// Unique identifier for the estimated fee which allows locking the fee for a client.
  final String? uniqueId;

  /// Value of current estimated fee.
  final double? value;
}

/// Withdrawal fee class.
class WithdrawalFee extends WithdrawalFeeModel {
  /// Initializes Withdrawal fee class.
  const WithdrawalFee({
    super.expiryTime,
    super.uniqueId,
    super.value,
  });

  /// Creates an instance from JSON.
  factory WithdrawalFee.fromJson(Map<String, dynamic> json) => WithdrawalFee(
        expiryTime: getDateTime(json['expiry_time']),
        uniqueId: json['unique_id'],
        value: getDouble(json['value']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['unique_id'] = uniqueId;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WithdrawalFee copyWith({
    DateTime? expiryTime,
    String? uniqueId,
    double? value,
  }) =>
      WithdrawalFee(
        expiryTime: expiryTime ?? this.expiryTime,
        uniqueId: uniqueId ?? this.uniqueId,
        value: value ?? this.value,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
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
    required super.id,
  });

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
}
