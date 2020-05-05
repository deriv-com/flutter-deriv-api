import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_order_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P order class
class P2POrder extends P2POrderModel {
  /// Initializes
  P2POrder({
    String accountCurrency,
    P2PAdvert advertDetails,
    P2PAdvertiser advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    DateTime createdTime,
    DateTime expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    OrderStatusType status,
    OrderType type,
  }) : super(
          accountCurrency: accountCurrency,
          advertDetails: advertDetails,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          createdTime: createdTime,
          expiryTime: expiryTime,
          id: id,
          isIncoming: isIncoming,
          localCurrency: localCurrency,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
        );

  /// Generates an instance from json
  factory P2POrder.fromJson(Map<String, dynamic> json) => P2POrder(
        accountCurrency: json['account_currency'],
        advertDetails: P2PAdvert.fromJson(json['advert_details']),
        advertiserDetails: P2PAdvertiser.fromJson(json['advertiser_details']),
        amount: json['amount']?.toDouble(),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        expiryTime: getDateTime(json['expiry_time']),
        id: json['id'],
        isIncoming: getBool(json['is_incoming']),
        localCurrency: json['local_currency'],
        price: json['price']?.toDouble(),
        priceDisplay: json['price_display'],
        rate: json['rate']?.toDouble(),
        rateDisplay: json['rate_display'],
        status: getEnumFromString(
          values: OrderStatusType.values,
          name: json['status'],
        ),
        paymentInfo: json['payment_info'],
        type: getEnumFromString(
          values: OrderType.values,
          name: json['type'],
        ),
      );

  /// Generates a copy of instance with given parameters
  P2POrder copyWith({
    String accountCurrency,
    P2PAdvert advertDetails,
    P2PAdvertiser advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    DateTime createdTime,
    DateTime expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    OrderStatusType status,
    OrderType type,
  }) =>
      P2POrder(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertDetails: advertDetails ?? this.advertDetails,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        expiryTime: expiryTime ?? this.expiryTime,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        status: status ?? this.status,
        type: type ?? this.type,
      );
}
