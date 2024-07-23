import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/crypto_config_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/crypto_config_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/crypto_config_send.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [CryptoConfigResponseExtended] class to implement
/// the API call methods.
class CryptoConfigResponseExtended extends CryptoConfigResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetches the available wallets that can be created
  static Future<CryptoConfigResponse> fetchCryptoConfig({
    required CryptoConfigRequest request,
  }) async {
    final CryptoConfigReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return CryptoConfigResponse.fromJson(response.cryptoConfig);
  }
}
