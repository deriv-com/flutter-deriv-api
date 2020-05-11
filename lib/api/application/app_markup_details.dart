import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';
import 'package:flutter_deriv_api/api/application/models/app_markup_details_model.dart';
import 'package:flutter_deriv_api/api/application/models/app_transaction_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App markup details class
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Initializes
  AppMarkupDetails({
    List<AppTransactionModel> transactions,
  }) : super(
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: getListFromMap(
          json['transactions'],
          itemToTypeCallback: (dynamic item) =>
              AppTransactionModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  AppMarkupDetails copyWith({
    List<AppTransactionModel> transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );

  /// Retrieve details of app markup according to criteria specified
  /// For parameters information refer to [AppMarkupDetailsRequest]
  static Future<AppMarkupDetails> fetchApplicationMarkupDetails(
    AppMarkupDetailsRequest request,
  ) async {
    final AppMarkupDetailsResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ApplicationException(message: response.error['message']);
    }

    return AppMarkupDetails.fromJson(response.appMarkupDetails);
  }
}
