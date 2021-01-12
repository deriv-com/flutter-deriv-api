import 'package:meta/meta.dart';

import '../../basic_api/generated/p2p_advert_create_receive.dart';
import '../../basic_api/generated/p2p_advert_create_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/p2p_advert_exception.dart';
import '../models/base_exception_model.dart';

/// P2p advert create response model class
abstract class P2pAdvertCreateResponseModel {
  /// Initializes
  P2pAdvertCreateResponseModel({
    @required this.p2pAdvertCreate,
  });

  /// The information of the created P2P advert.
  final P2pAdvertCreate p2pAdvertCreate;
}

/// P2p advert create response class
class P2pAdvertCreateResponse extends P2pAdvertCreateResponseModel {
  /// Initializes
  P2pAdvertCreateResponse({
    @required P2pAdvertCreate p2pAdvertCreate,
  }) : super(
          p2pAdvertCreate: p2pAdvertCreate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertCreateResponse.fromJson(
    dynamic p2pAdvertCreateJson,
  ) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreateJson == null
            ? null
            : P2pAdvertCreate.fromJson(p2pAdvertCreateJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertCreate != null) {
      resultMap['p2p_advert_create'] = p2pAdvertCreate.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertCreateResponse> createAdvert(
    P2pAdvertCreateSend request,
  ) async {
    final P2pAdvertCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertCreateResponse.fromJson(response.p2pAdvertCreate);
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertCreateResponse copyWith({
    P2pAdvertCreate p2pAdvertCreate,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
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
/// P2p advert create model class
abstract class P2pAdvertCreateModel {
  /// Initializes
  P2pAdvertCreateModel({
    @required this.accountCurrency,
    @required this.advertiserDetails,
    @required this.amount,
    @required this.amountDisplay,
    @required this.contactInfo,
    @required this.counterpartyType,
    @required this.country,
    @required this.createdTime,
    @required this.description,
    @required this.id,
    @required this.isActive,
    @required this.localCurrency,
    @required this.maxOrderAmount,
    @required this.maxOrderAmountDisplay,
    @required this.minOrderAmount,
    @required this.minOrderAmountDisplay,
    @required this.paymentInfo,
    @required this.paymentMethod,
    @required this.price,
    @required this.priceDisplay,
    @required this.rate,
    @required this.rateDisplay,
    @required this.remainingAmount,
    @required this.remainingAmountDisplay,
    @required this.type,
  });

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// The target country code of the advert.
  final String country;

  /// The advert creation time in epoch.
  final DateTime createdTime;

  /// General information about the advert.
  final String description;

  /// The unique identifier for this advert.
  final String id;

  /// The activation status of the advert.
  final bool isActive;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String maxOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// The payment method.
  final PaymentMethodEnum paymentMethod;

  /// Cost of the advert in local currency.
  final double price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// Whether this is a buy or a sell.
  final TypeEnum type;
}

/// P2p advert create class
class P2pAdvertCreate extends P2pAdvertCreateModel {
  /// Initializes
  P2pAdvertCreate({
    @required String accountCurrency,
    @required AdvertiserDetails advertiserDetails,
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
    @required double minOrderAmount,
    @required String minOrderAmountDisplay,
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
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
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
  factory P2pAdvertCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreate(
        accountCurrency: json['account_currency'],
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : AdvertiserDetails.fromJson(json['advertiser_details']),
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
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
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
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
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
  P2pAdvertCreate copyWith({
    String accountCurrency,
    AdvertiserDetails advertiserDetails,
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
    double minOrderAmount,
    String minOrderAmountDisplay,
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
      P2pAdvertCreate(
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
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
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
/// Advertiser details model class
abstract class AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetailsModel({
    @required this.firstName,
    @required this.id,
    @required this.lastName,
    @required this.name,
  });

  /// The advertiser's first name.
  final String firstName;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's displayed name.
  final String name;
}

/// Advertiser details class
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetails({
    @required String firstName,
    @required String id,
    @required String lastName,
    @required String name,
  }) : super(
          firstName: firstName,
          id: id,
          lastName: lastName,
          name: name,
        );

  /// Creates an instance from JSON
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        firstName: json['first_name'],
        id: json['id'],
        lastName: json['last_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['first_name'] = firstName;
    resultMap['id'] = id;
    resultMap['last_name'] = lastName;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AdvertiserDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String name,
  }) =>
      AdvertiserDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
      );
}
