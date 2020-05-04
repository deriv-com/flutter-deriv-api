import 'base_model.dart';
import 'enums.dart';
import 'p2p_advert_model.dart';
import 'p2p_advertiser_model.dart';

/// Order information model class
abstract class P2POrderModel extends BaseModel {
  /// Initializes
  P2POrderModel({
    this.accountCurrency,
    this.advertDetails,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.createdTime,
    this.expiryTime,
    this.id,
    this.isIncoming,
    this.localCurrency,
    this.paymentInfo,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.status,
    this.type,
  });

  /// The currency of order.
  final String accountCurrency;

  /// Details of the advert for this order.
  ///
  /// Only some fields of [advertDetails] that client who retrieving order info
  /// is allowed to see, will be filled:
  /// [P2PAdvertModel.id], [P2PAdvertModel.description],
  /// [P2PAdvertModel.paymentMethod], [P2PAdvertModel.type].
  /// Others will be null
  final P2PAdvertModel advertDetails;

  /// Details of the advertiser for this order.
  ///
  /// Only some fields of [advertiserDetails] that client who retrieving order
  /// info is allowed to see, will be filled:
  /// [P2PAdvertiserModel.id], [P2PAdvertiserModel.name].
  /// Others will be null
  final P2PAdvertiserModel advertiserDetails;

  /// The amount of the order.
  final double amount;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// Seller contact information.
  final String contactInfo;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

  /// The unique identifier for this order.
  final String id;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  /// (true for advertiser receiving order)
  final bool isIncoming;

  /// Local currency for this order.
  final String localCurrency;

  /// Payment instructions.
  final String paymentInfo;

  /// Cost in local currency.
  final double price;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Status of order
  final OrderStatusType status;

  /// Whether this is a buy or a sell.
  final OrderType type;
}
