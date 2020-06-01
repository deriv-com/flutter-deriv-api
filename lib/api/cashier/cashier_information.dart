import 'package:flutter_deriv_api/api/cashier/exceptions/cashier_exception.dart';
import 'package:flutter_deriv_api/api/cashier/models/cashier_information_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'models/cashier_api_model.dart';

/// Cashier information
class CashierInformation extends CashierInformationModel {
  /// Initializes
  CashierInformation({
    CashierAPIModel cashierAPI,
    String cashierURL,
  }) : super(cashierAPI: cashierAPI, cashierURL: cashierURL);

  /// Generates an instance from JSON
  factory CashierInformation.fromJson(
    Map<String, dynamic> json,
  ) =>
      CashierInformation(
        cashierURL: json['cashier'] is String ? json['cashier'] : null,
        cashierAPI: getItemFromMap(
          json['cashier'] is Map ? json['cashier'] : null,
          itemToTypeCallback: (dynamic item) => CashierAPIModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the cashier URL for given [CashierRequest]
  static Future<CashierInformation> fetchInformation(
    CashierRequest request,
  ) async {
    final CashierResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => CashierException(message: message),
    );

    return CashierInformation(cashierURL: response.cashier);
  }

  /// Creates a copy with given parameters
  CashierInformation copyWith({
    CashierAPIModel cashierAPI,
    String cashierURL,
  }) =>
      CashierInformation(
        cashierAPI: cashierAPI ?? this.cashierAPI,
        cashierURL: cashierURL ?? this.cashierURL,
      );
}
