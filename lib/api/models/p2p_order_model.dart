import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

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
    this.description,
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
  final P2PAdvertModel advertDetails;

  /// Details of the advertiser for this order.
  final P2PAdvertiserModel advertiserDetails;

  /// The amount of the order.
  final double amount;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// Seller contact information.
  final String contactInfo;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Order's description
  final String description;

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

  static OrderStatusType _getOrderStatusType(String status) {
    switch (status) {
      case 'pending':
        return OrderStatusType.pending;
      case 'buyer-confirmed':
        return OrderStatusType.buyerConfirmed;
      case 'cancelled':
        return OrderStatusType.cancelled;
      case 'timed-out':
        return OrderStatusType.timedOut;
      case 'refunded': // expired after buyerConfirmed
        return OrderStatusType.timedOutBuyerConfirmed;
      case 'completed':
        return OrderStatusType.completed;
      default:
        return null;
    }
  }
}
