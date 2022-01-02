// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Cashier response model class.
abstract class CashierResponseModel extends Equatable {
  /// Initializes Cashier response model class .
  const CashierResponseModel({
    this.cashierString,
    this.cashierObject,
  });

  /// Response for type `url`, It will return url to cashier service.
  final String? cashierString;

  /// Response for type `api'.
  final CashierObject? cashierObject;
}

/// Cashier response class.
class CashierResponse extends CashierResponseModel {
  /// Initializes Cashier response class.
  const CashierResponse({
    String? cashierString,
    CashierObject? cashierObject,
  }) : super(
          cashierString: cashierString,
          cashierObject: cashierObject,
        );

  /// Creates an instance from JSON.
  factory CashierResponse.fromJson(
    dynamic cashierStringJson,
    dynamic cashierObjectJson,
  ) =>
      CashierResponse(
        cashierString: cashierStringJson is String ? cashierStringJson : null,
        cashierObject: cashierObjectJson is Map<String, dynamic>?
            ? cashierObjectJson == null
                ? null
                : CashierObject.fromJson(cashierObjectJson)
            : null,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['cashier_string'] = cashierString;
    if (cashierObject != null) {
      resultMap['cashier_object'] = cashierObject!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the cashier URL for given [CashierRequest]
  static Future<CashierResponse> fetchInformation(
    CashierRequest request,
  ) async {
    final CashierReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          CashierException(baseExceptionModel: baseExceptionModel),
    );

    return CashierResponse.fromJson(response.cashier, response.cashier);
  }

  /// Creates a copy of instance with given parameters.
  CashierResponse copyWith({
    String? cashierString,
    CashierObject? cashierObject,
  }) =>
      CashierResponse(
        cashierString: cashierString ?? this.cashierString,
        cashierObject: cashierObject ?? this.cashierObject,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// ActionEnum mapper.
final Map<String, ActionEnum> actionEnumMapper = <String, ActionEnum>{
  "deposit": ActionEnum.deposit,
  "withdraw": ActionEnum.withdraw,
};

/// Action Enum.
enum ActionEnum {
  /// deposit.
  deposit,

  /// withdraw.
  withdraw,
}
/// Cashier object model class.
abstract class CashierObjectModel extends Equatable {
  /// Initializes Cashier object model class .
  const CashierObjectModel({
    required this.action,
    this.deposit,
    this.withdraw,
  });

  /// Type of operation, which is requested.
  final ActionEnum action;

  /// [Optional] Result for `deposit` action.
  final Deposit? deposit;

  /// [Optional] Result for `withdraw` action.
  final Map<String, dynamic>? withdraw;
}

/// Cashier object class.
class CashierObject extends CashierObjectModel {
  /// Initializes Cashier object class.
  const CashierObject({
    required ActionEnum action,
    Deposit? deposit,
    Map<String, dynamic>? withdraw,
  }) : super(
          action: action,
          deposit: deposit,
          withdraw: withdraw,
        );

  /// Creates an instance from JSON.
  factory CashierObject.fromJson(Map<String, dynamic> json) => CashierObject(
        action: actionEnumMapper[json['action']]!,
        deposit:
            json['deposit'] == null ? null : Deposit.fromJson(json['deposit']),
        withdraw: json['withdraw'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action'] = actionEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ActionEnum> entry) => entry.value == action)
        .key;
    if (deposit != null) {
      resultMap['deposit'] = deposit!.toJson();
    }
    resultMap['withdraw'] = withdraw;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierObject copyWith({
    required ActionEnum action,
    Deposit? deposit,
    Map<String, dynamic>? withdraw,
  }) =>
      CashierObject(
        action: action,
        deposit: deposit ?? this.deposit,
        withdraw: withdraw ?? this.withdraw,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Deposit model class.
abstract class DepositModel extends Equatable {
  /// Initializes Deposit model class .
  const DepositModel({
    required this.address,
  });

  /// Address for crypto deposit.
  final String address;
}

/// Deposit class.
class Deposit extends DepositModel {
  /// Initializes Deposit class.
  const Deposit({
    required String address,
  }) : super(
          address: address,
        );

  /// Creates an instance from JSON.
  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        address: json['address'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address'] = address;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Deposit copyWith({
    required String address,
  }) =>
      Deposit(
        address: address,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
