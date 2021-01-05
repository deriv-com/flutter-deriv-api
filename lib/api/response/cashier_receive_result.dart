import 'package:meta/meta.dart';

import '../../basic_api/generated/cashier_receive.dart';
import '../../basic_api/generated/cashier_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../utils/helpers.dart';
import '../exceptions/cashier_exception.dart';
import '../models/base_exception_model.dart';

/// Cashier response model class
abstract class CashierResponseModel {
  /// Initializes
  CashierResponseModel({
    @required this.cashier,
  });

  /// Possible error codes are:
  /// - `ASK_TNC_APPROVAL`: API call `tnc_approval`
  /// - `ASK_AUTHENTICATE`
  /// - `ASK_UK_FUNDS_PROTECTION`: API call `tnc_approval`
  /// - `ASK_CURRENCY`: API call `set_account_currency`
  /// - `ASK_EMAIL_VERIFY`: API call `verify_email`
  /// - `ASK_FIX_DETAILS`: API call `set_settings`
  final dynamic cashier;
}

/// Cashier response class
class CashierResponse extends CashierResponseModel {
  /// Initializes
  CashierResponse({
    @required dynamic cashier,
  }) : super(
          cashier: cashier,
        );

  /// Creates an instance from JSON
  factory CashierResponse.fromJson(
    dynamic cashierJson,
  ) =>
      CashierResponse(
        cashier: cashierJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['cashier'] = cashier;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the cashier URL for given [CashierRequest]
  static Future<CashierResponse> fetchInformation(
    CashierSend request,
  ) async {
    final CashierReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          CashierException(baseExceptionModel: baseExceptionModel),
    );

    return CashierResponse.fromJson(response);
  }

  /// Creates a copy of instance with given parameters
  CashierResponse copyWith({
    dynamic cashier,
  }) =>
      CashierResponse(
        cashier: cashier ?? this.cashier,
      );
}
