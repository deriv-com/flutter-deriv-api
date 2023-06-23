import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advert_info_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advert_update_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_create_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extends [P2pAdvertInfoResponse] with additional methods.
class P2pAdvertInfoResponseExtended extends P2pAdvertInfoResponse {
  /// Initializes a new instance of [P2pAdvertInfoResponseExtended].
  P2pAdvertInfoResponseExtended({
    super.p2pAdvertInfo,
    super.subscription,
  });

  factory P2pAdvertInfoResponseExtended._cast(P2pAdvertInfoResponse response) =>
      P2pAdvertInfoResponseExtended(
        p2pAdvertInfo: response.p2pAdvertInfo,
        subscription: response.subscription,
      );

  /// Creates an instance from JSON.
  factory P2pAdvertInfoResponseExtended.fromJson(
    dynamic json,
    dynamic subscriptionJson,
  ) =>
      P2pAdvertInfoResponseExtended._cast(
        P2pAdvertInfoResponse.fromJson(json, subscriptionJson),
      );

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Retrieves information about a P2P (peer to peer) advert.
  ///
  /// For parameters information refer to [P2pAdvertInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pAdvertInfoResponseExtended> fetchAdvert(
    P2pAdvertInfoRequest request,
  ) async {
    final P2pAdvertInfoReceive response = await fetchAdvertRaw(request);

    return P2pAdvertInfoResponseExtended.fromJson(
      response.p2pAdvertInfo,
      response.subscription,
    );
  }

  /// Retrieves information about a P2P (peer to peer) advert.
  ///
  /// For parameters information refer to [P2pAdvertInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pAdvertInfoReceive> fetchAdvertRaw(
    P2pAdvertInfoRequest request,
  ) async {
    final P2pAdvertInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// [delete] to permanently delete the advert
  /// [isActive] to activate or deactivate the advert
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateResponse> update({
    bool? delete,
    bool? isActive,
  }) =>
      P2pAdvertUpdateResponse.updateAdvert(
        P2pAdvertUpdateRequest(
          id: p2pAdvertInfo?.id,
          delete: delete ?? false,
          isActive: isActive ?? p2pAdvertInfo?.isActive,
        ),
      );

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// [delete] to permanently delete the advert
  /// [isActive] to activate or deactivate the advert
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateReceive> updateRaw({
    bool? delete,
    bool? isActive,
  }) =>
      P2pAdvertUpdateResponse.updateAdvertRaw(
        P2pAdvertUpdateRequest(
          id: p2pAdvertInfo?.id,
          delete: delete ?? false,
          isActive: isActive ?? p2pAdvertInfo?.isActive,
        ),
      );

  /// Deletes permanently a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateResponse> delete() => update(delete: true);

  /// Deletes permanently a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateReceive> deleteRaw() => updateRaw(delete: true);

  /// Activates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateResponse> activate() async => update(isActive: true);

  /// Activates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateReceive> activateRaw() async =>
      updateRaw(isActive: true);

  /// Deactivates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateResponse> deactivate() async => update(isActive: false);

  /// Deactivates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pAdvertUpdateReceive> deactivateRaw() async =>
      updateRaw(isActive: false);

  /// Creates order on this advert.
  ///
  /// [amount] is the amount of currency to be bought or sold.
  /// [contactInfo] is seller contact information. Only applicable for [OrderType.sell].
  /// [paymentInfo] is payment instructions. Only applicable for [OrderType.sell].
  /// Throws [BaseAPIException] if API response contains an error.
  Future<P2pOrderCreateResponse> createOrder({
    required double amount,
    String? contactInfo,
    String? paymentInfo,
  }) =>
      P2pOrderCreateResponse.create(
        P2pOrderCreateRequest(
          advertId: p2pAdvertInfo?.id,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          paymentMethodIds: const <int>[],
        ),
      );

  /// Creates order on this advert.
  ///
  /// [amount] is the amount of currency to be bought or sold.
  /// [contactInfo] is seller contact information. Only applicable for [OrderType.sell].
  /// [paymentInfo] is payment instructions. Only applicable for [OrderType.sell].
  /// Throws [BaseAPIException] if API response contains an error.
  Future<P2pOrderCreateReceive> createOrderRaw({
    required double amount,
    String? contactInfo,
    String? paymentInfo,
  }) =>
      P2pOrderCreateResponse.createRaw(
        P2pOrderCreateRequest(
          advertId: p2pAdvertInfo?.id,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          paymentMethodIds: const <int>[],
        ),
      );

  /// Unsubscribes all exchange rates streams.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ForgetAllResponse> unsubscribeAllP2pAdvertInfo() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pAdvertInfo);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }
}
