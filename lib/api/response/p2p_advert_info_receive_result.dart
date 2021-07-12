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

/// P2p advert info response model class.
abstract class P2pAdvertInfoResponseModel {
  /// Initializes.
  P2pAdvertInfoResponseModel({
    this.p2pAdvertInfo,
  });

  /// P2P advert information.
  final P2pAdvertInfo? p2pAdvertInfo;
}

/// P2p advert info response class.
class P2pAdvertInfoResponse extends P2pAdvertInfoResponseModel {
  /// Initializes
  P2pAdvertInfoResponse({
    P2pAdvertInfo? p2pAdvertInfo,
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
      resultMap['p2p_advert_info'] = p2pAdvertInfo!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

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
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertInfoResponse.fromJson(response.p2pAdvertInfo);
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// [delete] to permanently delete the advert
  /// [isActive] to activate or deactivate the advert
  /// Throws a [P2PAdvertException] if API response contains an error
  Future<P2pAdvertUpdateResponse> update({
    bool? delete,
    bool? isActive,
  }) =>
      P2pAdvertUpdateResponse.updateAdvert(
        P2pAdvertUpdateSend(
          id: p2pAdvertInfo?.id,
          delete: delete ?? false,
          isActive: isActive ?? p2pAdvertInfo?.isActive,
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
    required double amount,
    String? contactInfo,
    String? paymentInfo,
  }) =>
      P2pOrderCreateResponse.create(
        P2pOrderCreateSend(
          advertId: p2pAdvertInfo?.id,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          paymentMethodIds: const <int>[],
        ),
      );

  /// Creates a copy of instance with given parameters.
  P2pAdvertInfoResponse copyWith({
    P2pAdvertInfo? p2pAdvertInfo,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
      );
}

/// CounterpartyTypeEnum mapper.
final Map<String, CounterpartyTypeEnum> counterpartyTypeEnumMapper =
    <String, CounterpartyTypeEnum>{
  "buy": CounterpartyTypeEnum.buy,
  "sell": CounterpartyTypeEnum.sell,
};

/// CounterpartyType Enum.
enum CounterpartyTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// Type Enum.
enum TypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}
/// P2p advert info model class.
abstract class P2pAdvertInfoModel {
  /// Initializes.
  P2pAdvertInfoModel({
    required this.type,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.minOrderAmountLimitDisplay,
    required this.minOrderAmountLimit,
    required this.maxOrderAmountLimitDisplay,
    required this.maxOrderAmountLimit,
    required this.localCurrency,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.advertiserDetails,
    required this.accountCurrency,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.daysUntilArchive,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodIds,
    this.remainingAmount,
    this.remainingAmountDisplay,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost of the advert in local currency.
  final double price;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

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

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String? amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String? maxOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double? minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String? minOrderAmountDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// IDs of payment methods.
  final List<int>? paymentMethodIds;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double? remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String? remainingAmountDisplay;
}

/// P2p advert info class.
class P2pAdvertInfo extends P2pAdvertInfoModel {
  /// Initializes
  P2pAdvertInfo({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required TypeEnum type,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    int? daysUntilArchive,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    String? paymentInfo,
    String? paymentMethod,
    List<int>? paymentMethodIds,
    double? remainingAmount,
    String? remainingAmountDisplay,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          type: type,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          daysUntilArchive: daysUntilArchive,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodIds: paymentMethodIds,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfo.fromJson(Map<String, dynamic> json) => P2pAdvertInfo(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        counterpartyType:
            counterpartyTypeEnumMapper[json['counterparty_type']]!,
        country: json['country'],
        createdTime: getDateTime(json['created_time'])!,
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active'])!,
        localCurrency: json['local_currency'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit'])!,
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit'])!,
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        type: typeEnumMapper[json['type']]!,
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        daysUntilArchive: json['days_until_archive'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'],
        paymentMethodIds: json['payment_method_ids'] == null
            ? null
            : List<int>.from(
                json['payment_method_ids']?.map(
                  (dynamic item) => item,
                ),
              ),
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, CounterpartyTypeEnum> entry) =>
            entry.value == counterpartyType)
        .key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['is_active'] = isActive;
    resultMap['local_currency'] = localCurrency;
    resultMap['max_order_amount_limit'] = maxOrderAmountLimit;
    resultMap['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    resultMap['min_order_amount_limit'] = minOrderAmountLimit;
    resultMap['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['contact_info'] = contactInfo;
    resultMap['days_until_archive'] = daysUntilArchive;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethod;
    if (paymentMethodIds != null) {
      resultMap['payment_method_ids'] = paymentMethodIds!
          .map<dynamic>(
            (int item) => item,
          )
          .toList();
    }
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertInfo copyWith({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required TypeEnum type,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    int? daysUntilArchive,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    String? paymentInfo,
    String? paymentMethod,
    List<int>? paymentMethodIds,
    double? remainingAmount,
    String? remainingAmountDisplay,
  }) =>
      P2pAdvertInfo(
        accountCurrency: accountCurrency,
        advertiserDetails: advertiserDetails,
        counterpartyType: counterpartyType,
        country: country,
        createdTime: createdTime,
        description: description,
        id: id,
        isActive: isActive,
        localCurrency: localCurrency,
        maxOrderAmountLimit: maxOrderAmountLimit,
        maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
        minOrderAmountLimit: minOrderAmountLimit,
        minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        type: type,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes.
  AdvertiserDetailsModel({
    required this.name,
    required this.id,
    this.firstName,
    this.lastName,
    this.totalCompletionRate,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double? totalCompletionRate;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetails({
    required String id,
    required String name,
    String? firstName,
    String? lastName,
    double? totalCompletionRate,
  }) : super(
          id: id,
          name: name,
          firstName: firstName,
          lastName: lastName,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    required String id,
    required String name,
    String? firstName,
    String? lastName,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        id: id,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
