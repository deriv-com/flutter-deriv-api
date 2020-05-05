import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advert_model.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_details_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P advert class
class P2PAdvert extends P2PAdvertModel {
  /// Initializes
  P2PAdvert({
    String accountCurrency,
    P2PAdvertiserDetailsModel advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    TransactionType counterpartyType,
    String country,
    DateTime createdTime,
    String description,
    String id,
    bool isActive,
    String localCurrency,
    double maxOrderAmount,
    String maxOrderAmountDisplay,
    double maxOrderAmountLimit,
    String maxOrderAmountLimitDisplay,
    double minOrderAmount,
    String minOrderAmountDisplay,
    double minOrderAmountLimit,
    String minOrderAmountLimitDisplay,
    String paymentInfo,
    PaymentMethod paymentMethod,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    double remainingAmount,
    String remainingAmountDisplay,
    TransactionType type,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
        );

  /// Generate an instance from json
  factory P2PAdvert.fromJson(Map<String, dynamic> json) => P2PAdvert(
        accountCurrency: json['account_currency'],
        advertiserDetails: getItemFromMap(
          json['advertiser_details'],
          itemToTypeCallback: (dynamic item) =>
              P2PAdvertiserDetailsModel.fromJson(item),
        ),
        amount: json['amount']?.toDouble(),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        counterpartyType: getEnumFromString(
          values: TransactionType.values,
          name: json['counterparty_type'],
        ),
        country: json['country'],
        createdTime: getDateTime(json['created_time']),
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active']),
        localCurrency: json['local_currency'],
        maxOrderAmount: json['max_order_amount']?.toDouble(),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: json['max_order_amount_limit']?.toDouble(),
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: json['min_order_amount']?.toDouble(),
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: json['min_order_amount_limit']?.toDouble(),
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        paymentInfo: json['payment_info'],
        paymentMethod: getEnumFromString(
          values: PaymentMethod.values,
          name: json['payment_method'],
        ),
        price: json['price']?.toDouble(),
        priceDisplay: json['price_display'],
        rate: json['rate']?.toDouble(),
        rateDisplay: json['rate_display'],
        remainingAmount: json['remaining_amount']?.toDouble(),
        remainingAmountDisplay: json['remaining_amount_display'],
        type: getEnumFromString(
          values: TransactionType.values,
          name: json['type'],
        ),
      );

  /// Generate a copy of instance with given parameters
  P2PAdvert copyWith({
    String accountCurrency,
    P2PAdvertiserDetailsModel advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    TransactionType counterpartyType,
    String country,
    DateTime createdTime,
    String description,
    String id,
    bool isActive,
    String localCurrency,
    double maxOrderAmount,
    String maxOrderAmountDisplay,
    double maxOrderAmountLimit,
    String maxOrderAmountLimitDisplay,
    double minOrderAmount,
    String minOrderAmountDisplay,
    double minOrderAmountLimit,
    String minOrderAmountLimitDisplay,
    String paymentInfo,
    PaymentMethod paymentMethod,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    double remainingAmount,
    String remainingAmountDisplay,
    TransactionType type,
  }) =>
      P2PAdvert(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        description: description ?? this.description,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        maxOrderAmountLimit: maxOrderAmountLimit ?? this.maxOrderAmountLimit,
        maxOrderAmountLimitDisplay:
            maxOrderAmountLimitDisplay ?? this.maxOrderAmountLimitDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        minOrderAmountLimit: minOrderAmountLimit ?? this.minOrderAmountLimit,
        minOrderAmountLimitDisplay:
            minOrderAmountLimitDisplay ?? this.minOrderAmountLimitDisplay,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
      );
}
