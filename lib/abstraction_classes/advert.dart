import 'package:flutter_deriv_api/enums.dart';
import 'package:flutter_deriv_api/models/advert.dart';
import 'package:flutter_deriv_api/services/secure_storage.dart';
import 'package:flutter_deriv_api/abstraction_classes/order.dart';
import 'package:flutter_deriv_api/abstraction_classes/advertiser.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';
import 'package:flutter_deriv_api/extensions/payment_method_extension.dart';

/// Account abstraction class
class Advert extends AdvertModel {
  /// Class constructor
  Advert({
    BinaryAPI api,
    String id,
    AdvertType counterpartyType,
    String accountCurrency,
    Advertiser advertiserDetails,
    double amount,
    String amountDisplay,
    double remainingAmount,
    String remainingAmountDisplay,
    String country,
    int createdTime,
    bool isActive,
    String localCurrency,
    double maxOrderAmountLimit,
    String maxOrderAmountLimitDisplay,
    double maxOrderAmount,
    String maxOrderAmountDisplay,
    PaymentMethod paymentMethod,
    double minOrderAmountLimit,
    String minOrderAmountLimitDisplay,
    double minOrderAmount,
    String minOrderAmountDisplay,
    String description,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    AdvertType type,
    String paymentDetails,
    String contactDetails,
  }) : super(
          api: api,
          id: id,
          counterpartyType: counterpartyType,
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          country: country,
          createdTime: createdTime,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          paymentMethod: paymentMethod,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          description: description,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          type: type,
          paymentDetails: paymentDetails,
          contactDetails: contactDetails,
        );

  /// Extract class from a map object
  factory Advert.fromMap(Map<String, dynamic> advert) => Advert(
        id: advert['id'],
        accountCurrency: advert['account_currency'],
        advertiserDetails: Advertiser.fromMap(
            advert['advertiser_details'] ?? <String, dynamic>{}),
        amount: advert['amount']?.toDouble(),
        amountDisplay: advert['amount_display'],
        country: advert['country'],
        counterpartyType:
            advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        createdTime: advert['created_time'],
        description: advert['description'],
        isActive: advert['is_active'] == 1,
        localCurrency: advert['local_currency'],
        maxOrderAmount: advert['max_order_amount']?.toDouble(),
        maxOrderAmountDisplay: advert['max_order_amount_display'],
        maxOrderAmountLimit: advert['max_order_amount_limit']?.toDouble(),
        maxOrderAmountLimitDisplay: advert['max_order_amount_limit_display'],
        paymentMethod: _getPaymentMethod(advert['payment_method']),
        minOrderAmount: advert['min_order_amount']?.toDouble(),
        minOrderAmountDisplay: advert['min_order_amount_display'],
        minOrderAmountLimit: advert['min_order_amount_limit']?.toDouble(),
        minOrderAmountLimitDisplay: advert['min_order_amount_limit_display'],
        price: advert['price']?.toDouble(),
        priceDisplay: advert['price_display'],
        rate: advert['rate']?.toDouble(),
        rateDisplay: advert['rate_display'],
        remainingAmount: advert['remaining_amount']?.toDouble(),
        remainingAmountDisplay: advert['remaining_amount_display'],
        type: advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        paymentDetails: advert['payment_info'],
        contactDetails: advert['contact_info'],
      );

  /// Convert object to a map
  Map<String, dynamic> toMap(Advert advert) => <String, dynamic>{
        'amount': advert.amount,
        'country': advert.country,
        'description': advert.description,
        'id': advert.id,
        'local_currency': advert.localCurrency,
        'max_order_amount': advert.maxOrderAmount,
        'min_order_amount': advert.minOrderAmount,
        'payment_method': advert.paymentMethod.methodCode,
        'rate': advert.rate,
        'type': advert.counterpartyType == AdvertType.sell ? 'sell' : 'buy',
        'payment_info': paymentDetails,
        'contact_info': contactDetails,
      };

  /// Update desired class fields
  Advert copyWith({
    String accountCurrency,
    Advertiser advertiserDetails,
    double amount,
    double amountUsed,
    String country,
    AdvertType counterpartyType,
    int createdTime,
    bool isActive,
    String localCurrency,
    double maxAmount,
    double maxAmountLimit,
    PaymentMethod paymentMethod,
    double minAmount,
    double minAmountLimit,
    String orderDescription,
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
        remainingAmount: amountUsed ?? remainingAmount,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        isActive: isActive ?? this.isActive,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxAmount ?? maxOrderAmount,
        maxOrderAmountLimit: maxAmountLimit ?? maxOrderAmountLimit,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        minOrderAmount: minAmount ?? minOrderAmount,
        minOrderAmountLimit: minAmountLimit ?? minOrderAmountLimit,
        description: orderDescription ?? description,
        id: id,
        price: price ?? this.price,
        rate: rate ?? this.rate,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        contactDetails: contactDetails ?? this.contactDetails,
      );

  /// It will be false if the remaining amount of the advert is less than the minAmount.
  bool get isPurchasable => remainingAmount >= minOrderAmountLimit;

  /// Get payment method display name
  String get paymentMethodDisplay {
    switch (paymentMethod) {
      case PaymentMethod.bankTransfer:
        return 'Bank transfer';
      default:
        throw Exception('No display value for $paymentMethod payment method.');
    }
  }

  /// Get payment information label
  String get paymentInfoLabel {
    switch (paymentMethod) {
      case PaymentMethod.bankTransfer:
        return 'Bank details';
      default:
        throw Exception(
            'No payment info label for $paymentMethod payment method.');
    }
  }

  /// Create order
  Future<Order> createOrder(
    Order order,
  ) async {
    final Map<String, dynamic> response = await api.p2pOrderCreate(
      advertId: id,
      amount: amount,
      paymentInfo: order.paymentInfo,
      contactInfo: order.contactInfo,
    );

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      final Order submittedOrder = Order.fromMap(response['p2p_order_create']);
      await SecureStorage().saveUserInput(order.amount);

      return submittedOrder;
    }
  }

  /// Update advert
  Future<Advert> update() async {
    final Map<String, dynamic> response = await api.p2pAdvertUpdate(
      <String, dynamic>{
        'id': id,
        'delete': 1,
      },
    );

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      return Advert.fromMap(response['p2p_advert_update']);
    }
  }

  /// Get advertiser adverts
  Future<List<Advert>> getAdverts({
    bool isSell,
    int start,
    int count,
  }) async {
    Map<String, dynamic> response;
    List<Advert> adverts = <Advert>[];

    response = await api.p2pAdvertList(
      counterpartyType: isSell ? 'sell' : 'buy',
      offset: start,
      limit: count,
      advertiserId: null,
    );

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      response['p2p_advert_list']['list'].forEach(
        (Map<String, dynamic> response) => adverts.add(
          Advert.fromMap(response),
        ),
      );

      adverts = adverts.where((Advert advert) => advert.isActive).toList();
    }

    return adverts;
  }

  static PaymentMethod _getPaymentMethod(String paymentMethod) =>
      paymentMethod == 'bank_transfer' ? PaymentMethod.bankTransfer : null;
}
