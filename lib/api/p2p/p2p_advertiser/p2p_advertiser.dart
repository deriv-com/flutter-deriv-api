import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/exceptions/p2p_advertiser_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P advertise class
class P2PAdvertiser extends P2PAdvertiserModel {
  /// Initializes
  P2PAdvertiser({
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String defaultAdvertDescription,
    String id,
    bool isApproved,
    bool isListed,
    String name,
    String paymentInfo,
    this.subscriptionInformation,
  }) : super(
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          defaultAdvertDescription: defaultAdvertDescription,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          paymentInfo: paymentInfo,
        );

  /// Generate an instance from JSON
  factory P2PAdvertiser.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      P2PAdvertiser(
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        defaultAdvertDescription: json['default_advert_description'],
        id: json['id'],
        isApproved: getBool(json['is_approved']),
        isListed: getBool(json['is_listed']),
        name: json['name'],
        paymentInfo: json['payment_info'],
        subscriptionInformation: getItemFromMap(
          subscriptionJson,
          itemToTypeCallback: (dynamic item) =>
              SubscriptionModel.fromJson(item),
        ),
      );

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  P2PAdvertiser copyWith({
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String defaultAdvertDescription,
    String id,
    bool isApproved,
    bool isListed,
    String name,
    String paymentInfo,
    SubscriptionModel subscriptionInformation,
  }) =>
      P2PAdvertiser(
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        name: name ?? this.name,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );

  /// Retrieves information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Future<P2PAdvertiser> fetchAdvertiserInformation(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoResponse response = await _api.call(
      request: request.copyWith(subscribe: 0),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return P2PAdvertiser.fromJson(response.p2pAdvertiserInfo);
  }

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2PAdvertiser> subscribeAdvertiserInformation(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<P2PAdvertiser>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: (String message) =>
                P2PAdvertiserException(message: message),
          );

          return response is P2pAdvertiserInfoResponse
              ? P2PAdvertiser.fromJson(
                  response.p2pAdvertiserInfo,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Future<P2PAdvertiser> createAdvertiser(
    P2pAdvertiserCreateRequest request,
  ) async {
    final P2pAdvertiserCreateResponse response = await _api.call(
      request: request.copyWith(subscribe: 0),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return P2PAdvertiser.fromJson(response.p2pAdvertiserCreate);
  }

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Stream<P2PAdvertiser> createAdvertiserAndSubscribe(
    P2pAdvertiserCreateRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<P2PAdvertiser>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: (String message) =>
                P2PAdvertiserException(message: message),
          );

          return response is P2pAdvertiserInfoResponse
              ? P2PAdvertiser.fromJson(
                  response.p2pAdvertiserInfo,
                  subscriptionJson: response.subscription,
                )
              : response is P2pAdvertiserCreateResponse
                  ? P2PAdvertiser.fromJson(
                      response.p2pAdvertiserCreate,
                      subscriptionJson: response.subscription,
                    )
                  : null;
        },
      );

  /// Updates the information of the P2P (peer to peer) advertiser for the current account.
  /// Can only be used by an approved P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserUpdateRequest].
  static Future<P2PAdvertiser> updateAdvertiser(
    P2pAdvertiserUpdateRequest request,
  ) async {
    final P2pAdvertiserUpdateResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return P2PAdvertiser.fromJson(response.p2pAdvertiserUpdate);
  }

  /// Returns all P2P (peer to peer) adverts created by the authorized client.
  /// Can only be used by a registered P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserAdvertsRequest].
  static Future<List<P2PAdvert>> fetchAdvertiserAdverts(
    P2pAdvertiserAdvertsRequest request,
  ) async {
    final P2pAdvertiserAdvertsResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return getListFromMap(
      response.p2pAdvertiserAdverts['list'],
      itemToTypeCallback: (dynamic item) => P2PAdvert.fromJson(item),
    );
  }

  /// Unsubscribes from P2P (peer to peer) advertiser information.
  Future<Forget> unsubscribeAdvertiser() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all P2P (peer to peer) advertisers.
  static Future<ForgetAll> unsubscribeAllAdvertiser() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pAdvertiser);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          P2PAdvertiserException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }
}
