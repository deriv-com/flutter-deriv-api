import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advertiser_info_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extends [P2pAdvertiserInfoResponse] with additional methods.
class P2pAdvertiserInfoResponseExtended extends P2pAdvertiserInfoResponse {
  /// Initializes a new instance of [P2pAdvertiserInfoResponseExtended].
  P2pAdvertiserInfoResponseExtended({
    super.p2pAdvertiserInfo,
    super.subscription,
  });

  factory P2pAdvertiserInfoResponseExtended._cast(
    P2pAdvertiserInfoResponse response,
  ) =>
      P2pAdvertiserInfoResponseExtended(
        p2pAdvertiserInfo: response.p2pAdvertiserInfo,
        subscription: response.subscription,
      );

  /// Creates an instance from JSON.
  factory P2pAdvertiserInfoResponseExtended.fromJson(
    dynamic json,
    dynamic subscriptionJson,
  ) =>
      P2pAdvertiserInfoResponseExtended._cast(
        P2pAdvertiserInfoResponse.fromJson(json, subscriptionJson),
      );

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<P2pAdvertiserInfoResponseExtended> fetchAdvertiserInformation(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoReceive response =
        await fetchAdvertiserInformationRaw(request);

    return P2pAdvertiserInfoResponseExtended.fromJson(
      response.p2pAdvertiserInfo,
      response.subscription,
    );
  }

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<P2pAdvertiserInfoReceive> fetchAdvertiserInformationRaw(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    return response;
  }

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoResponseExtended?>
      subscribeAdvertiserInformation(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
          subscribeAdvertiserInformationRaw(
            request,
            comparePredicate: comparePredicate,
          ).map(
            (P2pAdvertiserInfoReceive? response) => response == null
                ? null
                : P2pAdvertiserInfoResponseExtended.fromJson(
                    response.p2pAdvertiserInfo,
                    response.subscription,
                  ),
          );

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoReceive?> subscribeAdvertiserInformationRaw(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pAdvertiserInfoReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pAdvertiserInfoReceive ? response : null;
        },
      );

  /// Unsubscribes from P2P (peer to peer) advertiser information.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  Future<ForgetResponse?> unsubscribeAdvertiser() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes from P2P (peer to peer) advertiser information.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  /// [subscriptionId] is the id of the subscription to unsubscribe from.
  static Future<ForgetResponse?> unsubscribeAdvertiserRaw(
    String subscriptionId,
  ) async {
    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscriptionId);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all P2P (peer to peer) advertisers.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ForgetAllResponse> unsubscribeAllAdvertiser() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pAdvertiser);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }
}
