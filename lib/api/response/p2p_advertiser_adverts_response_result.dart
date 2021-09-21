// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_adverts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_adverts_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// P2p advertiser adverts response model class.
abstract class P2pAdvertiserAdvertsResponseModel {
  /// Initializes P2p advertiser adverts response model class .
  P2pAdvertiserAdvertsResponseModel({
    this.p2pAdvertiserAdverts,
  });

  /// List of the P2P advertiser adverts.
  final P2pAdvertiserAdverts? p2pAdvertiserAdverts;
}

/// P2p advertiser adverts response class.
class P2pAdvertiserAdvertsResponse extends P2pAdvertiserAdvertsResponseModel {
  /// Initializes P2p advertiser adverts response class.
  P2pAdvertiserAdvertsResponse({
    P2pAdvertiserAdverts? p2pAdvertiserAdverts,
  }) : super(
          p2pAdvertiserAdverts: p2pAdvertiserAdverts,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdvertsResponse.fromJson(
    dynamic p2pAdvertiserAdvertsJson,
  ) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdvertsJson == null
            ? null
            : P2pAdvertiserAdverts.fromJson(p2pAdvertiserAdvertsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserAdverts != null) {
      resultMap['p2p_advertiser_adverts'] = p2pAdvertiserAdverts!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Returns all P2P (peer to peer) adverts created by the authorized client.
  /// Can only be used by a registered P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserAdvertsRequest].
  static Future<P2pAdvertiserAdvertsResponse> fetchAdvertiserAdverts(
    P2pAdvertiserAdvertsRequest request,
  ) async {
    final P2pAdvertiserAdvertsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserAdvertsResponse.fromJson(response.p2pAdvertiserAdverts);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserAdvertsResponse copyWith({
    P2pAdvertiserAdverts? p2pAdvertiserAdverts,
  }) =>
      P2pAdvertiserAdvertsResponse(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
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
/// P2p advertiser adverts model class.
abstract class P2pAdvertiserAdvertsModel {
  /// Initializes P2p advertiser adverts model class .
  P2pAdvertiserAdvertsModel({
    required this.list,
  });

  /// List of advertiser adverts.
  final List<ListItem> list;
}

/// P2p advertiser adverts class.
class P2pAdvertiserAdverts extends P2pAdvertiserAdvertsModel {
  /// Initializes P2p advertiser adverts class.
  P2pAdvertiserAdverts({
    required List<ListItem> list,
  }) : super(
          list: list,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserAdverts.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdverts(
        list: List<ListItem>.from(
          json['list'].map(
            (dynamic item) => ListItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['list'] = list
        .map<dynamic>(
          (ListItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserAdverts copyWith({
    required List<ListItem> list,
  }) =>
      P2pAdvertiserAdverts(
        list: list,
      );
}
/// List item model class.
abstract class ListItemModel {
  /// Initializes List item model class .
  ListItemModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.paymentInfo,
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
    required this.contactInfo,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.accountCurrency,
    this.daysUntilArchive,
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

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// Minimum order amount, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountDisplay;

  /// Minimum order amount, in `account_currency`.
  final double minOrderAmount;

  /// Maximum order amount, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountDisplay;

  /// Maximum order amount, in `account_currency`.
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

  /// This is the type of transaction from the counterparty's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// IDs of payment methods.
  final List<int>? paymentMethodIds;
}

/// List item class.
class ListItem extends ListItemModel {
  /// Initializes List item class.
  ListItem({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required String contactInfo,
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
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum type,
    int? daysUntilArchive,
    String? paymentMethod,
    List<int>? paymentMethodIds,
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
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          daysUntilArchive: daysUntilArchive,
          paymentMethod: paymentMethod,
          paymentMethodIds: paymentMethodIds,
        );

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
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
        paymentInfo: json['payment_info'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: typeEnumMapper[json['type']]!,
        daysUntilArchive: json['days_until_archive'],
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
    resultMap['contact_info'] = contactInfo;
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
    resultMap['payment_info'] = paymentInfo;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['days_until_archive'] = daysUntilArchive;
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
  ListItem copyWith({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required String contactInfo,
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
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum type,
    int? daysUntilArchive,
    String? paymentMethod,
    List<int>? paymentMethodIds,
  }) =>
      ListItem(
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
        minOrderAmount: minOrderAmount,
        minOrderAmountDisplay: minOrderAmountDisplay,
        paymentInfo: paymentInfo,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        remainingAmount: remainingAmount,
        remainingAmountDisplay: remainingAmountDisplay,
        type: type,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
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
