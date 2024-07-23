import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Spot price updates for a given symbol
abstract class TickBaseModel extends APIBaseModel {
  /// Initializes
  TickBaseModel({
    this.epoch,
    this.id,
    this.pipSize,
    this.symbol,
  });

  /// Epoch time of the tick
  final DateTime? epoch;

  /// A stream ID that can be used to cancel this stream using
  /// the Forget request
  final String? id;

  /// Indicates the number of decimal points that
  /// the returned amounts must be displayed with
  final int? pipSize;

  /// Symbol
  final String? symbol;
}

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

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Unsubscribes from tick stream
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<ForgetResponse?> unsubscribe() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation!.id!);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
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
