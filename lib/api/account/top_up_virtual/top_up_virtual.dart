import 'package:flutter_deriv_api/api/account/models/top_up_virtual_model.dart';
import 'package:flutter_deriv_api/api/account/top_up_virtual/exceptions/top_up_virtual_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Top-Up virtual class
class TopUpVirtual extends TopUpVirtualModel {
  /// Initializes
  TopUpVirtual({
    double amount,
    String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Generates an instance from JSON
  factory TopUpVirtual.fromJson(Map<String, dynamic> json) => TopUpVirtual(
        amount: json['amount']?.toDouble(),
        currency: json['currency'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  TopUpVirtual copyWith({
    double amount,
    String currency,
  }) =>
      TopUpVirtual(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );

  /// Topes up the virtual-money's account balance becomes when it becomes low.
  ///
  /// For parameters information refer to [TopupVirtualRequest].
  /// Throws a [TopUpVirtualException] if API response contains an error
  static Future<TopUpVirtual> topUp([
    TopupVirtualRequest request,
  ]) async {
    final TopupVirtualResponse response = await _api.call(
      request: request ?? const TopupVirtualRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) => TopUpVirtualException(
        message: message,
      ),
    );

    return TopUpVirtual.fromJson(response.topupVirtual);
  }
}
