import 'package:meta/meta.dart';

import '../../basic_api/generated/p2p_advert_info_receive.dart';
import '../../basic_api/generated/p2p_advert_info_send.dart';
import '../../basic_api/generated/p2p_advert_update_send.dart';
import '../../basic_api/generated/p2p_order_create_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import 'p2p_advert_update_receive_result.dart';
import 'p2p_order_create_receive_result.dart';

/// P2p advert info response model class
abstract class P2pAdvertInfoResponseModel {
  /// Initializes
  P2pAdvertInfoResponseModel({
    @required this.p2pAdvertInfo,
  });

  /// P2P advert information.
  final P2pAdvertInfo p2pAdvertInfo;
}

/// P2p advert info response class
class P2pAdvertInfoResponse extends P2pAdvertInfoResponseModel {
  /// Initializes
  P2pAdvertInfoResponse({
    @required P2pAdvertInfo p2pAdvertInfo,
  }) : super(
          p2pAdvertInfo: p2pAdvertInfo,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfoResponse.fromJson(
    dynamic p2pAdvertInfoJson,
  ) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfoJson == null
            ? null
            : P2pAdvertInfo.fromJson(p2pAdvertInfoJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertInfo != null) {
      resultMap['p2p_advert_info'] = p2pAdvertInfo.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves information about a P2P (peer to peer) advert.
  ///
  /// For parameters information refer to [P2pAdvertInfoRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertInfoResponse> fetchAdvert(
    P2pAdvertInfoSend request,
  ) async {
    final P2pAdvertInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertInfoResponse.fromJson(response.p2pAdvertInfo);
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// [delete] to permanently delete the advert
  /// [isActive] to activate or deactivate the advert
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2pAdvertUpdateResponse> update({bool delete, bool isActive}) =>
      P2pAdvertUpdateResponse.updateAdvert(
        P2pAdvertUpdateSend(
          id: p2pAdvertInfo.id,
          delete: delete ?? false,
          isActive: isActive ?? p2pAdvertInfo.isActive,
        ),
      );

  /// Deletes permanently a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2pAdvertUpdateResponse> delete() => update(delete: true);

  /// Activates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2pAdvertUpdateResponse> activate() async => update(isActive: true);

  /// Deactivates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2pAdvertUpdateResponse> deactivate() async => update(isActive: false);

  /// Creates order on this advert.
  ///
  /// [amount] is the amount of currency to be bought or sold.
  /// [contactInfo] is seller contact information. Only applicable for [OrderType.sell].
  /// [paymentInfo] is payment instructions. Only applicable for [OrderType.sell].
  /// Throws [P2POrderException] if API response contains an error.
  Future<P2pOrderCreateResponse> createOrder({
    @required double amount,
    String contactInfo,
    String paymentInfo,
  }) =>
      P2pOrderCreateResponse.create(
        P2pOrderCreateSend(
          advertId: p2pAdvertInfo.id,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
        ),
      );

  /// Creates a copy of instance with given parameters
  P2pAdvertInfoResponse copyWith({
    P2pAdvertInfo p2pAdvertInfo,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
      );
}

final Map<String, CounterpartyTypeEnum> counterpartyTypeEnumMapper =
    <String, CounterpartyTypeEnum>{
  "buy": CounterpartyTypeEnum.buy,
  "sell": CounterpartyTypeEnum.sell,
};

/// counterparty_type Enum
enum CounterpartyTypeEnum {
  buy,
  sell,
}

final Map<String, PaymentMethodEnum> paymentMethodEnumMapper =
    <String, PaymentMethodEnum>{
  "bank_transfer": PaymentMethodEnum.bankTransfer,
};

/// payment_method Enum
enum PaymentMethodEnum {
  bankTransfer,
}

final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// type Enum
enum TypeEnum {
  buy,
  sell,
}
/// P2p advert info model class
abstract class P2pAdvertInfoModel {
  /// Initializes
  P2pAdvertInfoModel({
    @required this.type,
    @required this.remainingAmountDisplay,
    @required this.remainingAmount,
    @required this.rateDisplay,
    @required this.rate,
    @required this.priceDisplay,
    @required this.price,
    @required this.paymentMethod,
    @required this.paymentInfo,
    @required this.minOrderAmountLimitDisplay,
    @required this.minOrderAmountLimit,
    @required this.minOrderAmountDisplay,
    @required this.minOrderAmount,
    @required this.maxOrderAmountLimitDisplay,
    @required this.maxOrderAmountLimit,
    @required this.maxOrderAmountDisplay,
    @required this.maxOrderAmount,
    @required this.localCurrency,
    @required this.isActive,
    @required this.id,
    @required this.description,
    @required this.createdTime,
    @required this.country,
    @required this.counterpartyType,
    @required this.contactInfo,
    @required this.amountDisplay,
    @required this.amount,
    @required this.advertiserDetails,
    @required this.accountCurrency,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost of the advert in local currency.
  final double price;

  /// The payment method.
  final PaymentMethodEnum paymentMethod;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String maxOrderAmountDisplay;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double maxOrderAmount;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// The activation status of the advert.
  final bool isActive;

  /// The unique identifier for this advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// The advert creation time in epoch.
  final DateTime createdTime;

  /// The target country code of the advert.
  final String country;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// Details of the advertiser for this advert.
  final P2pAdvertInfoAdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;
}

/// P2p advert info class
class P2pAdvertInfo extends P2pAdvertInfoModel {
  /// Initializes
  P2pAdvertInfo({
    @required String accountCurrency,
    @required P2pAdvertInfoAdvertiserDetails advertiserDetails,
    @required double amount,
    @required String amountDisplay,
    @required String contactInfo,
    @required CounterpartyTypeEnum counterpartyType,
    @required String country,
    @required DateTime createdTime,
    @required String description,
    @required String id,
    @required bool isActive,
    @required String localCurrency,
    @required double maxOrderAmount,
    @required String maxOrderAmountDisplay,
    @required double maxOrderAmountLimit,
    @required String maxOrderAmountLimitDisplay,
    @required double minOrderAmount,
    @required String minOrderAmountDisplay,
    @required double minOrderAmountLimit,
    @required String minOrderAmountLimitDisplay,
    @required String paymentInfo,
    @required PaymentMethodEnum paymentMethod,
    @required double price,
    @required String priceDisplay,
    @required double rate,
    @required String rateDisplay,
    @required double remainingAmount,
    @required String remainingAmountDisplay,
    @required TypeEnum type,
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

  /// Creates an instance from JSON
  factory P2pAdvertInfo.fromJson(Map<String, dynamic> json) => P2pAdvertInfo(
        accountCurrency: json['account_currency'],
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : P2pAdvertInfoAdvertiserDetails.fromJson(
                json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        counterpartyType: counterpartyTypeEnumMapper[json['counterparty_type']],
        country: json['country'],
        createdTime: getDateTime(json['created_time']),
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active']),
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit']),
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit']),
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        paymentInfo: json['payment_info'],
        paymentMethod: paymentMethodEnumMapper[json['payment_method']],
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
        type: typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    if (advertiserDetails != null) {
      resultMap['advertiser_details'] = advertiserDetails.toJson();
    }
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['contact_info'] = contactInfo;
    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == counterpartyType,
            orElse: () => null)
        ?.key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['is_active'] = isActive;
    resultMap['local_currency'] = localCurrency;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['max_order_amount_limit'] = maxOrderAmountLimit;
    resultMap['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['min_order_amount_limit'] = minOrderAmountLimit;
    resultMap['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethodEnumMapper.entries
        .firstWhere((entry) => entry.value == paymentMethod, orElse: () => null)
        ?.key;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((entry) => entry.value == type, orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertInfo copyWith({
    String accountCurrency,
    P2pAdvertInfoAdvertiserDetails advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    CounterpartyTypeEnum counterpartyType,
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
    PaymentMethodEnum paymentMethod,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    double remainingAmount,
    String remainingAmountDisplay,
    TypeEnum type,
  }) =>
      P2pAdvertInfo(
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
/// P2p advert info advertiser details model class
abstract class P2pAdvertInfoAdvertiserDetailsModel {
  /// Initializes
  P2pAdvertInfoAdvertiserDetailsModel({
    @required this.name,
    @required this.lastName,
    @required this.id,
    @required this.firstName,
    this.completionRate,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String firstName;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double completionRate;
}

/// P2p advert info advertiser details class
class P2pAdvertInfoAdvertiserDetails
    extends P2pAdvertInfoAdvertiserDetailsModel {
  /// Initializes
  P2pAdvertInfoAdvertiserDetails({
    @required String firstName,
    @required String id,
    @required String lastName,
    @required String name,
    double completionRate,
  }) : super(
          firstName: firstName,
          id: id,
          lastName: lastName,
          name: name,
          completionRate: completionRate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfoAdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoAdvertiserDetails(
        firstName: json['first_name'],
        id: json['id'],
        lastName: json['last_name'],
        name: json['name'],
        completionRate: getDouble(json['completion_rate']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['first_name'] = firstName;
    resultMap['id'] = id;
    resultMap['last_name'] = lastName;
    resultMap['name'] = name;
    resultMap['completion_rate'] = completionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertInfoAdvertiserDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String name,
    double completionRate,
  }) =>
      P2pAdvertInfoAdvertiserDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
        completionRate: completionRate ?? this.completionRate,
      );
}
