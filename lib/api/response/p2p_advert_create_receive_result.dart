import '../../basic_api/generated/p2p_advert_create_receive.dart';
import '../../basic_api/generated/p2p_advert_create_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/p2p_advert_exception.dart';
import '../models/base_exception_model.dart';

/// P2p advert create response model class.
abstract class P2pAdvertCreateResponseModel {
  /// Initializes P2p advert create response model class .
  P2pAdvertCreateResponseModel({
    this.p2pAdvertCreate,
  });

  /// The information of the created P2P advert.
  final P2pAdvertCreate? p2pAdvertCreate;
}

/// P2p advert create response class.
class P2pAdvertCreateResponse extends P2pAdvertCreateResponseModel {
  /// Initializes P2p advert create response class.
  P2pAdvertCreateResponse({
    P2pAdvertCreate? p2pAdvertCreate,
  }) : super(
          p2pAdvertCreate: p2pAdvertCreate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreateResponse.fromJson(
    dynamic p2pAdvertCreateJson,
  ) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreateJson == null
            ? null
            : P2pAdvertCreate.fromJson(p2pAdvertCreateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertCreate != null) {
      resultMap['p2p_advert_create'] = p2pAdvertCreate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertCreateResponse> createAdvert(
    P2pAdvertCreateRequest request,
  ) async {
    final P2pAdvertCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertCreateResponse.fromJson(response.p2pAdvertCreate);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreateResponse copyWith({
    P2pAdvertCreate? p2pAdvertCreate,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
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
/// P2p advert create model class.
abstract class P2pAdvertCreateModel {
  /// Initializes P2p advert create model class .
  P2pAdvertCreateModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.minOrderAmountDisplay,
    required this.minOrderAmount,
    required this.maxOrderAmountDisplay,
    required this.maxOrderAmount,
    required this.localCurrency,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.accountCurrency,
    this.contactInfo,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodIds,
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

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

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

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// IDs of payment methods.
  final List<int>? paymentMethodIds;
}

/// P2p advert create class.
class P2pAdvertCreate extends P2pAdvertCreateModel {
  /// Initializes P2p advert create class.
  P2pAdvertCreate({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum type,
    String? contactInfo,
    String? paymentInfo,
    String? paymentMethod,
    List<int>? paymentMethodIds,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodIds: paymentMethodIds,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreate(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        counterpartyType:
            counterpartyTypeEnumMapper[json['counterparty_type']]!,
        country: json['country'],
        createdTime: getDateTime(json['created_time'])!,
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active'])!,
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount'])!,
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minOrderAmount: getDouble(json['min_order_amount'])!,
        minOrderAmountDisplay: json['min_order_amount_display'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: typeEnumMapper[json['type']]!,
        contactInfo: json['contact_info'],
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'],
        paymentMethodIds: json['payment_method_ids'] == null
            ? null
            : List<int>.from(
                json['payment_method_ids']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
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
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['contact_info'] = contactInfo;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethod;
    if (paymentMethodIds != null) {
      resultMap['payment_method_ids'] = paymentMethodIds!
          .map<dynamic>(
            (int item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreate copyWith({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum type,
    String? contactInfo,
    String? paymentInfo,
    String? paymentMethod,
    List<int>? paymentMethodIds,
  }) =>
      P2pAdvertCreate(
        accountCurrency: accountCurrency,
        advertiserDetails: advertiserDetails,
        amount: amount,
        amountDisplay: amountDisplay,
        counterpartyType: counterpartyType,
        country: country,
        createdTime: createdTime,
        description: description,
        id: id,
        isActive: isActive,
        localCurrency: localCurrency,
        maxOrderAmount: maxOrderAmount,
        maxOrderAmountDisplay: maxOrderAmountDisplay,
        minOrderAmount: minOrderAmount,
        minOrderAmountDisplay: minOrderAmountDisplay,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        remainingAmount: remainingAmount,
        remainingAmountDisplay: remainingAmountDisplay,
        type: type,
        contactInfo: contactInfo ?? this.contactInfo,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
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
  /// Initializes Advertiser details class.
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

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
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
