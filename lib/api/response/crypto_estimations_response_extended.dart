import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/crypto_estimations_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/crypto_estimations_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/crypto_estimations_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extended functionality for [CryptoEstimationsResponse] class.
class CryptoEstimationsResponseExtended extends CryptoEstimationsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// This will subscribe to crypto estimations.<br>
  /// Inside [CryptoEstimationsRequest] class:
  /// Incase of error, It will throw [BaseAPIException].
  static Stream<CryptoEstimationsResponse?> subscribeToCryptoEstimates(
      CryptoEstimationsRequest request, {
        RequestCompareFunction? comparePredicate,
      }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<CryptoEstimationsResponse?>(
            (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          if (response is CryptoEstimationsReceive) {
            return CryptoEstimationsResponse.fromJson(
                response.cryptoEstimations, response.subscription);
          } else {
            throw Exception('Bad response received');
          }
        },
      );

  /// unsubscribe from the subscribed Crypto Estimates <br>
  /// In case of error, It will throw [BaseAPIException].
  static Future<bool> unsubscribeFromCryptoEstimates(
      String subscriptionId) async {
    final ForgetReceive response =
    await _api.unsubscribe(subscriptionId: subscriptionId);
    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );
    return response.forget!;
  }
}