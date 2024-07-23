// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_dispute_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_dispute_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p order dispute response model class.
abstract class P2pOrderDisputeResponseModel {
  /// Initializes P2p order dispute response model class .
  const P2pOrderDisputeResponseModel({
    this.p2pOrderDispute,
  });

  /// Details of the disputed order.
  final P2pOrderDispute? p2pOrderDispute;
}

/// P2p order dispute response class.
class P2pOrderDisputeResponse extends P2pOrderDisputeResponseModel {
  /// Initializes P2p order dispute response class.
  const P2pOrderDisputeResponse({
    super.p2pOrderDispute,
  });

  /// Creates an instance from JSON.
  factory P2pOrderDisputeResponse.fromJson(
    dynamic p2pOrderDisputeJson,
  ) =>
      P2pOrderDisputeResponse(
        p2pOrderDispute: p2pOrderDisputeJson == null
            ? null
            : P2pOrderDispute.fromJson(p2pOrderDisputeJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderDispute != null) {
      resultMap['p2p_order_dispute'] = p2pOrderDispute!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Cancel a P2P order dispute.
  ///
  /// For parameters information refer to [P2pOrderDisputeRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<P2pOrderDisputeReceive> disputeOrderRaw(
    P2pOrderDisputeRequest request,
  ) async {
    final P2pOrderDisputeReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Cancel a P2P order dispute.
  ///
  /// For parameters information refer to [P2pOrderDisputeRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<P2pOrderDisputeResponse> disputeOrder(
    P2pOrderDisputeRequest request,
  ) async {
    final P2pOrderDisputeReceive response = await disputeOrderRaw(request);

    return P2pOrderDisputeResponse.fromJson(response.p2pOrderDispute);
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderDisputeResponse copyWith({
    P2pOrderDispute? p2pOrderDispute,
  }) =>
      P2pOrderDisputeResponse(
        p2pOrderDispute: p2pOrderDispute ?? this.p2pOrderDispute,
      );
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

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "pending": StatusEnum.pending,
  "buyer-confirmed": StatusEnum.buyerConfirmed,
  "cancelled": StatusEnum.cancelled,
  "timed-out": StatusEnum.timedOut,
  "blocked": StatusEnum.blocked,
  "refunded": StatusEnum.refunded,
  "completed": StatusEnum.completed,
  "disputed": StatusEnum.disputed,
  "dispute-refunded": StatusEnum.disputeRefunded,
  "dispute-completed": StatusEnum.disputeCompleted,
};

/// Status Enum.
enum StatusEnum {
  /// pending.
  pending,

  /// buyer-confirmed.
  buyerConfirmed,

  /// cancelled.
  cancelled,

  /// timed-out.
  timedOut,

  /// blocked.
  blocked,

  /// refunded.
  refunded,

  /// completed.
  completed,

  /// disputed.
  disputed,

  /// dispute-refunded.
  disputeRefunded,

  /// dispute-completed.
  disputeCompleted,
}

/// P2p order dispute model class.
abstract class P2pOrderDisputeModel {
  /// Initializes P2p order dispute model class .
  const P2pOrderDisputeModel({
    required this.type,
    required this.status,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.paymentInfo,
    required this.localCurrency,
    required this.isSeen,
    required this.isReviewable,
    required this.isIncoming,
    required this.id,
    required this.expiryTime,
    required this.disputeDetails,
    required this.createdTime,
    required this.contactInfo,
    required this.clientDetails,
    required this.chatChannelUrl,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.advertDetails,
    required this.accountCurrency,
    this.verificationLockoutUntil,
    this.verificationNextRequest,
    this.verificationPending,
    this.verificationTokenExpiry,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Current order status.
  final StatusEnum status;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost in local currency.
  final double price;

  /// Payment instructions.
  final String paymentInfo;

  /// Local currency for this order.
  final String localCurrency;

  /// `true` if the latest order changes have been seen by the current client, otherwise `false`.
  final bool isSeen;

  /// `true` if a review can be given, otherwise `false`.
  final bool isReviewable;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  final bool isIncoming;

  /// The unique identifier for this order.
  final String id;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

  /// Details of the order dispute.
  final DisputeDetails disputeDetails;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Seller contact information.
  final String contactInfo;

  /// Details of the client who created the order.
  final ClientDetails clientDetails;

  /// The URL to be used to initialise the chat for this order.
  final String chatChannelUrl;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The amount of the order.
  final double amount;

  /// Details of the advertiser for this order.
  final AdvertiserDetails advertiserDetails;

  /// Details of the advert for this order.
  final AdvertDetails advertDetails;

  /// The currency of order.
  final String accountCurrency;

  /// If blocked for too many failed verification attempts, the epoch time that the block will end.
  final DateTime? verificationLockoutUntil;

  /// If a verification request has already been made, the epoch time that another verification request can be made.
  final DateTime? verificationNextRequest;

  /// Indicates that the seller in the process of confirming the order.
  final bool? verificationPending;

  /// Epoch time that the current verification token will expire.
  final DateTime? verificationTokenExpiry;
}

/// P2p order dispute class.
class P2pOrderDispute extends P2pOrderDisputeModel {
  /// Initializes P2p order dispute class.
  const P2pOrderDispute({
    required super.accountCurrency,
    required super.advertDetails,
    required super.advertiserDetails,
    required super.amount,
    required super.amountDisplay,
    required super.chatChannelUrl,
    required super.clientDetails,
    required super.contactInfo,
    required super.createdTime,
    required super.disputeDetails,
    required super.expiryTime,
    required super.id,
    required super.isIncoming,
    required super.isReviewable,
    required super.isSeen,
    required super.localCurrency,
    required super.paymentInfo,
    required super.price,
    required super.priceDisplay,
    required super.rate,
    required super.rateDisplay,
    required super.status,
    required super.type,
    super.verificationLockoutUntil,
    super.verificationNextRequest,
    super.verificationPending,
    super.verificationTokenExpiry,
  });

  /// Creates an instance from JSON.
  factory P2pOrderDispute.fromJson(Map<String, dynamic> json) =>
      P2pOrderDispute(
        accountCurrency: json['account_currency'],
        advertDetails: AdvertDetails.fromJson(json['advert_details']),
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        chatChannelUrl: json['chat_channel_url'],
        clientDetails: ClientDetails.fromJson(json['client_details']),
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        disputeDetails: DisputeDetails.fromJson(json['dispute_details']),
        expiryTime: getDateTime(json['expiry_time'])!,
        id: json['id'],
        isIncoming: getBool(json['is_incoming'])!,
        isReviewable: getBool(json['is_reviewable'])!,
        isSeen: getBool(json['is_seen'])!,
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        status: statusEnumMapper[json['status']]!,
        type: typeEnumMapper[json['type']]!,
        verificationLockoutUntil:
            getDateTime(json['verification_lockout_until']),
        verificationNextRequest: getDateTime(json['verification_next_request']),
        verificationPending: getBool(json['verification_pending']),
        verificationTokenExpiry: getDateTime(json['verification_token_expiry']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['advert_details'] = advertDetails.toJson();

    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['chat_channel_url'] = chatChannelUrl;
    resultMap['client_details'] = clientDetails.toJson();

    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['dispute_details'] = disputeDetails.toJson();

    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['id'] = id;
    resultMap['is_incoming'] = isIncoming;
    resultMap['is_reviewable'] = isReviewable;
    resultMap['is_seen'] = isSeen;
    resultMap['local_currency'] = localCurrency;
    resultMap['payment_info'] = paymentInfo;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['verification_lockout_until'] =
        getSecondsSinceEpochDateTime(verificationLockoutUntil);
    resultMap['verification_next_request'] =
        getSecondsSinceEpochDateTime(verificationNextRequest);
    resultMap['verification_pending'] = verificationPending;
    resultMap['verification_token_expiry'] =
        getSecondsSinceEpochDateTime(verificationTokenExpiry);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderDispute copyWith({
    String? accountCurrency,
    AdvertDetails? advertDetails,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? chatChannelUrl,
    ClientDetails? clientDetails,
    String? contactInfo,
    DateTime? createdTime,
    DisputeDetails? disputeDetails,
    DateTime? expiryTime,
    String? id,
    bool? isIncoming,
    bool? isReviewable,
    bool? isSeen,
    String? localCurrency,
    String? paymentInfo,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    StatusEnum? status,
    TypeEnum? type,
    DateTime? verificationLockoutUntil,
    DateTime? verificationNextRequest,
    bool? verificationPending,
    DateTime? verificationTokenExpiry,
  }) =>
      P2pOrderDispute(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertDetails: advertDetails ?? this.advertDetails,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        chatChannelUrl: chatChannelUrl ?? this.chatChannelUrl,
        clientDetails: clientDetails ?? this.clientDetails,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        disputeDetails: disputeDetails ?? this.disputeDetails,
        expiryTime: expiryTime ?? this.expiryTime,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        isReviewable: isReviewable ?? this.isReviewable,
        isSeen: isSeen ?? this.isSeen,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        status: status ?? this.status,
        type: type ?? this.type,
        verificationLockoutUntil:
            verificationLockoutUntil ?? this.verificationLockoutUntil,
        verificationNextRequest:
            verificationNextRequest ?? this.verificationNextRequest,
        verificationPending: verificationPending ?? this.verificationPending,
        verificationTokenExpiry:
            verificationTokenExpiry ?? this.verificationTokenExpiry,
      );
}

/// Advert details model class.
abstract class AdvertDetailsModel {
  /// Initializes Advert details model class .
  const AdvertDetailsModel({
    required this.type,
    required this.id,
    required this.description,
    required this.blockTrade,
    this.paymentMethod,
  });

  /// Type of the advert.
  final TypeEnum type;

  /// The unique identifier for the advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// Indicates if this is block trade advert or not.
  final bool blockTrade;

  /// The payment method.
  final String? paymentMethod;
}

/// Advert details class.
class AdvertDetails extends AdvertDetailsModel {
  /// Initializes Advert details class.
  const AdvertDetails({
    required super.blockTrade,
    required super.description,
    required super.id,
    required super.type,
    super.paymentMethod,
  });

  /// Creates an instance from JSON.
  factory AdvertDetails.fromJson(Map<String, dynamic> json) => AdvertDetails(
        blockTrade: getBool(json['block_trade'])!,
        description: json['description'],
        id: json['id'],
        type: typeEnumMapper[json['type']]!,
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['block_trade'] = blockTrade;
    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertDetails copyWith({
    bool? blockTrade,
    String? description,
    String? id,
    TypeEnum? type,
    String? paymentMethod,
  }) =>
      AdvertDetails(
        blockTrade: blockTrade ?? this.blockTrade,
        description: description ?? this.description,
        id: id ?? this.id,
        type: type ?? this.type,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}

/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.name,
    required this.loginid,
    required this.isOnline,
    required this.id,
    this.firstName,
    this.lastName,
    this.lastOnlineTime,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's account identifier.
  final String loginid;

  /// Indicates if the advertiser is currently online.
  final bool isOnline;

  /// The advertiser's unique identifier.
  final String id;

  /// The client's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required super.id,
    required super.isOnline,
    required super.loginid,
    required super.name,
    super.firstName,
    super.lastName,
    super.lastOnlineTime,
  });

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        isOnline: getBool(json['is_online'])!,
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['is_online'] = isOnline;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    String? id,
    bool? isOnline,
    String? loginid,
    String? name,
    String? firstName,
    String? lastName,
    DateTime? lastOnlineTime,
  }) =>
      AdvertiserDetails(
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
      );
}

/// Client details model class.
abstract class ClientDetailsModel {
  /// Initializes Client details model class .
  const ClientDetailsModel({
    required this.name,
    required this.loginid,
    required this.isOnline,
    required this.id,
    this.firstName,
    this.lastName,
    this.lastOnlineTime,
  });

  /// The client's displayed name.
  final String name;

  /// The client's account identifier.
  final String loginid;

  /// Indicates if the advertiser is currently online.
  final bool isOnline;

  /// The client's unique P2P identifier.
  final String id;

  /// The client's first name.
  final String? firstName;

  /// The client's last name.
  final String? lastName;

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;
}

/// Client details class.
class ClientDetails extends ClientDetailsModel {
  /// Initializes Client details class.
  const ClientDetails({
    required super.id,
    required super.isOnline,
    required super.loginid,
    required super.name,
    super.firstName,
    super.lastName,
    super.lastOnlineTime,
  });

  /// Creates an instance from JSON.
  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        id: json['id'],
        isOnline: getBool(json['is_online'])!,
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['is_online'] = isOnline;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ClientDetails copyWith({
    String? id,
    bool? isOnline,
    String? loginid,
    String? name,
    String? firstName,
    String? lastName,
    DateTime? lastOnlineTime,
  }) =>
      ClientDetails(
        id: id ?? this.id,
        isOnline: isOnline ?? this.isOnline,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
      );
}

/// Dispute details model class.
abstract class DisputeDetailsModel {
  /// Initializes Dispute details model class .
  const DisputeDetailsModel({
    required this.disputerLoginid,
    required this.disputeReason,
  });

  /// The loginid of the client who's raising the dispute
  final String disputerLoginid;

  /// The dispute reason
  final String disputeReason;
}

/// Dispute details class.
class DisputeDetails extends DisputeDetailsModel {
  /// Initializes Dispute details class.
  const DisputeDetails({
    required super.disputeReason,
    required super.disputerLoginid,
  });

  /// Creates an instance from JSON.
  factory DisputeDetails.fromJson(Map<String, dynamic> json) => DisputeDetails(
        disputeReason: json['dispute_reason'],
        disputerLoginid: json['disputer_loginid'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['dispute_reason'] = disputeReason;
    resultMap['disputer_loginid'] = disputerLoginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DisputeDetails copyWith({
    String? disputeReason,
    String? disputerLoginid,
  }) =>
      DisputeDetails(
        disputeReason: disputeReason ?? this.disputeReason,
        disputerLoginid: disputerLoginid ?? this.disputerLoginid,
      );
}
