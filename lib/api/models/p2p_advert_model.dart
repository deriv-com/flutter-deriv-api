import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/p2p_advertiser_details_model.dart';

/// P2P advert model class
abstract class P2PAdvertModel extends BaseModel {
  /// Initializes
  P2PAdvertModel({
    this.accountCurrency,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.counterpartyType,
    this.country,
    this.createdTime,
    this.description,
    this.id,
    this.isActive,
    this.localCurrency,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.paymentInfo,
    this.paymentMethod,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.type,
  });

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Details of the advertiser for this advert.
  final P2PAdvertiserDetailsModel advertiserDetails;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// Type of transaction from the opposite party's perspective.
  final TransactionType counterpartyType;

  /// The target country code of the advert.
  final String country;

  /// The advert creation time in epoch.
  final DateTime createdTime;

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

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

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

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// Whether this is a buy or a sell.
  final TransactionType type;
}
