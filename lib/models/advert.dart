import 'package:flutter_deriv_api/enums.dart';
import 'package:flutter_deriv_api/models/base.dart';
import 'package:flutter_deriv_api/models/advertiser.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Advert Information
abstract class AdvertModel extends BaseModel {
  /// Class constructor
  AdvertModel({
    BinaryAPI api,
    this.id,
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
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.type,
    this.paymentDetails,
    this.contactDetails,
  }) : super(api: api);

  /// The unique identifier for this advert.
  final String id;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Details of the advertiser for this advert.
  final AdvertiserModel advertiserDetails;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
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
}
