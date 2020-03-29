import 'package:flutter_deriv_api/enums.dart';
import 'package:flutter_deriv_api/models/base.dart';
import 'package:flutter_deriv_api/models/advert.dart';
import 'package:flutter_deriv_api/models/advertiser.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// The information of p2p order.
class OrderModel extends BaseModel {
  /// Class constructor
  OrderModel({
    BinaryAPI api,
    this.id,
    this.accountCurrency,
    this.advertDetails,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.createdTime,
    this.description,
    this.expiryTime,
    this.isIncoming,
    this.localCurrency,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.status = OrderStatusType.pending,
    this.type,
    this.paymentInfo,
    this.contactInfo,
  }) : super(api: api);

  /// The currency of order.
  final String accountCurrency;

  /// Details of the advert for this order.
  final AdvertModel advertDetails;

  /// Details of the advertiser for this order.
  final AdvertiserModel advertiserDetails;

  /// The amount of the order.
  final double amount;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The epoch time of the order creation.
  final int createdTime;

  ///
  final String description;

  /// The epoch time in which the order will be expired.
  final int expiryTime;

  /// The unique identifier for this order.
  final String id;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  final bool isIncoming;

  /// Local currency for this order.
  final String localCurrency;

  /// Cost in local currency.
  final double price;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Type of the advert.
  final OrderType type;

  /// Payment instructions.
  final String paymentInfo;

  /// Seller contact information.
  final String contactInfo;

  /// Current order status.
  final OrderStatusType status;
}
