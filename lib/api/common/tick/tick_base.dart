import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/models/tick_base_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'exceptions/tick_exception.dart';

/// Spot price updates for a given symbol
class TickBase extends TickBaseModel {
  /// Initializes
  TickBase({
    DateTime? epoch,
    String? id,
    int? pipSize,
    String? symbol,
    this.subscriptionInformation,
  }) : super(
          epoch: epoch,
          id: id,
          pipSize: pipSize,
          symbol: symbol,
        );

  /// Generates an instance from JSON
  factory TickBase.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic>? subscriptionJson,
  }) =>
      TickBase(
        epoch: getDateTime(json['epoch']),
        id: json['id'],
        pipSize: json['pip_size'],
        symbol: json['symbol'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription information
  final SubscriptionModel? subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Unsubscribes from tick stream
  ///
  /// Throws a [TickException] if API response contains an error
  Future<Forget?> unsubscribe() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return Forget.fromResponse(response);
  }

  /// Generates a copy of instance with given parameters
  TickBase copyWith({
    DateTime? epoch,
    String? id,
    int? pipSize,
    String? symbol,
    SubscriptionModel? subscriptionInformation,
  }) =>
      TickBase(
        epoch: epoch ?? this.epoch,
        id: id ?? this.id,
        pipSize: pipSize ?? this.pipSize,
        symbol: symbol ?? this.symbol,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
