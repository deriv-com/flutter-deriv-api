// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/contract_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/contract_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Contract update response model class.
abstract class ContractUpdateResponseModel {
  /// Initializes Contract update response model class .
  const ContractUpdateResponseModel({
    this.contractUpdate,
  });

  /// Contains the update status of the request
  final ContractUpdate? contractUpdate;
}

/// Contract update response class.
class ContractUpdateResponse extends ContractUpdateResponseModel {
  /// Initializes Contract update response class.
  const ContractUpdateResponse({
    ContractUpdate? contractUpdate,
  }) : super(
          contractUpdate: contractUpdate,
        );

  /// Creates an instance from JSON.
  factory ContractUpdateResponse.fromJson(
    dynamic contractUpdateJson,
  ) =>
      ContractUpdateResponse(
        contractUpdate: contractUpdateJson == null
            ? null
            : ContractUpdate.fromJson(contractUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (contractUpdate != null) {
      resultMap['contract_update'] = contractUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// updates a contract with parameters specified in [ContractUpdateRequest].
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ContractUpdateResponse> updateContract(
    ContractUpdateRequest request,
  ) async {
    final ContractUpdateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ContractUpdateResponse.fromJson(response.contractUpdate);
  }

  /// Creates a copy of instance with given parameters.
  ContractUpdateResponse copyWith({
    ContractUpdate? contractUpdate,
  }) =>
      ContractUpdateResponse(
        contractUpdate: contractUpdate ?? this.contractUpdate,
      );
}

/// Contract update model class.
abstract class ContractUpdateModel {
  /// Initializes Contract update model class .
  const ContractUpdateModel({
    this.stopLoss,
    this.takeProfit,
  });

  /// The target spot price where the contract will be closed automatically at the loss specified by the user.
  final StopLoss? stopLoss;

  /// The target spot price where the contract will be closed automatically at the profit specified by the user.
  final TakeProfit? takeProfit;
}

/// Contract update class.
class ContractUpdate extends ContractUpdateModel {
  /// Initializes Contract update class.
  const ContractUpdate({
    StopLoss? stopLoss,
    TakeProfit? takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON.
  factory ContractUpdate.fromJson(Map<String, dynamic> json) => ContractUpdate(
        stopLoss: json['stop_loss'] == null
            ? null
            : StopLoss.fromJson(json['stop_loss']),
        takeProfit: json['take_profit'] == null
            ? null
            : TakeProfit.fromJson(json['take_profit']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (stopLoss != null) {
      resultMap['stop_loss'] = stopLoss!.toJson();
    }
    if (takeProfit != null) {
      resultMap['take_profit'] = takeProfit!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractUpdate copyWith({
    StopLoss? stopLoss,
    TakeProfit? takeProfit,
  }) =>
      ContractUpdate(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}

/// Stop loss model class.
abstract class StopLossModel extends Equatable {
  /// Initializes Stop loss model class .
  const StopLossModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Localized display name
  final String? displayName;

  /// Stop loss amount
  final double? orderAmount;

  /// Stop loss order epoch
  final DateTime? orderDate;

  /// Stop loss pip-sized barrier value
  final String? value;
}

/// Stop loss class.
class StopLoss extends StopLossModel {
  /// Initializes Stop loss class.
  const StopLoss({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON.
  factory StopLoss.fromJson(Map<String, dynamic> json) => StopLoss(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StopLoss copyWith({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) =>
      StopLoss(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[
        displayName,
        orderAmount,
      ];
}

/// Take profit model class.
abstract class TakeProfitModel extends Equatable {
  /// Initializes Take profit model class .
  const TakeProfitModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Localized display name
  final String? displayName;

  /// Take profit amount
  final double? orderAmount;

  /// Take profit order epoch
  final DateTime? orderDate;

  /// Take profit pip-sized barrier value
  final String? value;
}

/// Take profit class.
class TakeProfit extends TakeProfitModel {
  /// Initializes Take profit class.
  const TakeProfit({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON.
  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TakeProfit copyWith({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) =>
      TakeProfit(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[
        displayName,
        orderAmount,
      ];
}
