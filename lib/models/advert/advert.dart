import 'package:flutter_deriv_api/api/p2p_advert_info_send.dart';
import 'package:flutter_deriv_api/models/advert/advert_caller.dart';

import '../../enums/generals.dart';
import '../advertiser/advertiser.dart';

/// advert information class
class Advert {
  /// Initializes
  Advert({
    this.counterpartyType,
    this.accountCurrency,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.country,
    this.createdTime,
    this.isActive,
    this.localCurrency,
    this.maxOrderAmountLimit,
    this.maxOrderAmountLimitDisplay,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.paymentMethod,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.description,
    this.id,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.type,
    this.paymentDetails,
    this.contactDetails,
  });

  /// Initializes from JSON
  Advert.fromJson(Map<String, dynamic> advert)
      : accountCurrency = advert['account_currency'],
        advertiserDetails = Advertiser.fromJson(
            advert['advertiser_details'] ?? <String, dynamic>{}),
        amount = advert['amount']?.toDouble(),
        amountDisplay = advert['amount_display'],
        country = advert['country'],
        counterpartyType =
            advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        createdTime = advert['created_time'],
        description = advert['description'],
        id = advert['id'],
        isActive = advert['is_active'] == 1,
        localCurrency = advert['local_currency'],
        maxOrderAmount = advert['max_order_amount']?.toDouble(),
        maxOrderAmountDisplay = advert['max_order_amount_display'],
        maxOrderAmountLimit = advert['max_order_amount_limit']?.toDouble(),
        maxOrderAmountLimitDisplay = advert['max_order_amount_limit_display'],
        paymentMethod = _getPaymentMethod(advert['payment_method']),
        minOrderAmount = advert['min_order_amount']?.toDouble(),
        minOrderAmountDisplay = advert['min_order_amount_display'],
        minOrderAmountLimit = advert['min_order_amount_limit']?.toDouble(),
        minOrderAmountLimitDisplay = advert['min_order_amount_limit_display'],
        price = advert['price']?.toDouble(),
        priceDisplay = advert['price_display'],
        rate = advert['rate']?.toDouble(),
        rateDisplay = advert['rate_display'],
        remainingAmount = advert['remaining_amount']?.toDouble(),
        remainingAmountDisplay = advert['remaining_amount_display'],
        type = advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        paymentDetails = advert['payment_info'],
        contactDetails = advert['contact_info'];

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client
  final String accountCurrency;

  /// Details of the advertiser for this advert
  final Advertiser advertiserDetails;

  /// description": "The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// The target country code of the advert.
  final String country;

  /// Type of transaction from the opposite party's perspective.
  final AdvertType counterpartyType;

  /// The advert creation time in epoch.
  final int createdTime;

  /// General information about the advert.
  final String description;

  /// The unique identifier for this advert.
  final String id;

  /// The activation status of the advert.
  final bool isActive;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String maxOrderAmountDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// The payment method.
  final PaymentMethod paymentMethod;

  /// Cost of the advert in local currency.
  final double price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Whether this is a buy or a sell.
  final AdvertType type;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentDetails;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactDetails;

  /// It will be false if the remaining amount of the advert is less than the minAmount.
  bool get isPurchasable => remainingAmount >= minOrderAmountLimit;

  static final AdvertCaller _advertCaller = AdvertCaller();

  /// Fetches advert information
  Future<Advert> fetch(String id) =>
      _advertCaller.modelCall(P2pAdvertInfoRequest(id: id));

  /// Clone with different params
  Advert copyWith({
    String accountCurrency,
    Advertiser advertiserDetails,
    double amount,
    double remainingAmount,
    String country,
    AdvertType counterpartyType,
    int createdTime,
    bool isActive,
    String localCurrency,
    double maxOrderAmount,
    double maxOrderAmountLimit,
    PaymentMethod paymentMethod,
    double minOrderAmount,
    double minOrderAmountLimit,
    String description,
    double price,
    double rate,
    bool isDeleted,
    String paymentDetails,
    String contactDetails,
  }) =>
      Advert(
        counterpartyType: counterpartyType ?? this.counterpartyType,
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        isActive: isActive ?? this.isActive,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountLimit: maxOrderAmountLimit ?? this.maxOrderAmountLimit,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountLimit: minOrderAmountLimit ?? this.minOrderAmountLimit,
        description: description ?? this.description,
        id: id,
        price: price ?? this.price,
        rate: rate ?? this.rate,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        contactDetails: contactDetails ?? this.contactDetails,
      );

  static PaymentMethod _getPaymentMethod(String paymentMethod) =>
      paymentMethod == 'bank_transfer' ? PaymentMethod.bankTransfer : null;

  /// Display String for payment method
  String get paymentMethodDisplay {
    switch (paymentMethod) {
      case PaymentMethod.bankTransfer:
        return 'Bank transfer';
      default:
        throw Exception('No display value for $paymentMethod payment method.');
    }
  }

  /// Label for PaymentInfo
  String get paymentInfoLabel {
    switch (paymentMethod) {
      case PaymentMethod.bankTransfer:
        return 'Bank details';
      default:
        throw Exception(
            'No payment info label for $paymentMethod payment method.');
    }
  }

  @override
  String toString() => 'Advert { id: $id name: ${advertiserDetails.name} }';
}
