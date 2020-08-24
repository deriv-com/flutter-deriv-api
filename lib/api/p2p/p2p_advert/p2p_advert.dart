import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advert_model.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_details_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/exceptions/p2p_order_exception.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/p2p_order.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
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

  /// Generates an instance from JSON
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
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

  /// Retrieves information about a P2P (peer to peer) advert.
  ///
  /// For parameters information refer to [P2pAdvertInfoRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2PAdvert> fetchAdvert(
    P2pAdvertInfoRequest request,
  ) async {
    final P2pAdvertInfoResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertException(message: message),
    );

    return P2PAdvert.fromJson(response.p2pAdvertInfo);
  }

  /// Returns available adverts.
  ///
  /// For parameters information refer to [P2pAdvertListRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<List<P2PAdvert>> fetchAdvertList(
    P2pAdvertListRequest request,
  ) async {
    final P2pAdvertListResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertException(message: message),
    );

    return getListFromMap(
      response.p2pAdvertList['list'],
      itemToTypeCallback: (dynamic item) => P2PAdvert.fromJson(item),
    );
  }

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2PAdvert> createAdvert(
    P2pAdvertCreateRequest request,
  ) async {
    final P2pAdvertCreateResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertException(message: message),
    );

    return P2PAdvert.fromJson(response.p2pAdvertCreate);
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// For parameters information refer to [P2pAdvertUpdateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2PAdvert> updateAdvert(
    P2pAdvertUpdateRequest request,
  ) async {
    final P2pAdvertUpdateResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertException(message: message),
    );

    return P2PAdvert.fromJson(response.p2pAdvertUpdate);
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// [delete] to permanently delete the advert
  /// [isActive] to activate or deactivate the advert
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2PAdvert> update({bool delete, bool isActive}) => updateAdvert(
        P2pAdvertUpdateRequest(
          id: id,
          delete: delete ?? false,
          isActive: isActive ?? this.isActive,
        ),
      );

  /// Deletes permanently a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2PAdvert> delete() => update(delete: true);

  /// Activates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2PAdvert> activate() async =>
      isActive ? this : update(isActive: true);

  /// Deactivates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2PAdvert> deactivate() async =>
      isActive ? update(isActive: false) : this;

  /// Creates order on this advert.
  ///
  /// [amount] is the amount of currency to be bought or sold.
  /// [contactInfo] is seller contact information. Only applicable for [OrderType.sell].
  /// [paymentInfo] is payment instructions. Only applicable for [OrderType.sell].
  /// Throws [P2POrderException] if API response contains an error.
  Future<P2POrder> createOrder({
    @required double amount,
    String contactInfo,
    String paymentInfo,
  }) =>
      P2POrder.create(
        P2pOrderCreateRequest(
          advertId: id,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
        ),
      );
}
