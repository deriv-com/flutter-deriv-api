import '../../basic_api/generated/cashier_receive.dart';
import '../../basic_api/generated/cashier_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Cashier response model class.
abstract class CashierResponseModel {
  /// Initializes.
  CashierResponseModel({
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
  /// Initializes
  CashierResponse({
    String? cashierString,
    CashierObject? cashierObject,
  }) : super(
          cashierString: cashierString,
          cashierObject: cashierObject,
        );

  /// Creates an instance from JSON
  factory CashierResponse.fromJson(
    dynamic cashierStringJson,
    dynamic cashierObjectJson,
  ) =>
      CashierResponse(
        cashierString: cashierStringJson is String ? cashierStringJson : null,
        cashierObject: cashierObjectJson is Map<String, dynamic>
            ? cashierObjectJson == null
                ? null
                : CashierObject.fromJson(cashierObjectJson)
            : null,
      );

  /// Converts an instance to JSON
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
    CashierSend request,
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
}

/// ActionEnum mapper.
final Map<String, ActionEnum> actionEnumMapper = <String, ActionEnum>{
  "deposit": ActionEnum.deposit,
};

/// Action Enum.
enum ActionEnum {
  /// deposit.
  deposit,
}
/// Cashier object model class.
abstract class CashierObjectModel {
  /// Initializes.
  CashierObjectModel({
    this.action,
    this.deposit,
  });

  /// Type of operation, which is requested.
  final ActionEnum? action;

  /// [Optional] Result for deposit operation.
  final Deposit? deposit;
}

/// Cashier object class.
class CashierObject extends CashierObjectModel {
  /// Initializes
  CashierObject({
    ActionEnum? action,
    Deposit? deposit,
  }) : super(
          action: action,
          deposit: deposit,
        );

  /// Creates an instance from JSON
  factory CashierObject.fromJson(Map<String, dynamic> json) => CashierObject(
        action:
            json['action'] == null ? null : actionEnumMapper[json['action']]!,
        deposit:
            json['deposit'] == null ? null : Deposit.fromJson(json['deposit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action'] = actionEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ActionEnum> entry) => entry.value == action)
        .key;
    if (deposit != null) {
      resultMap['deposit'] = deposit!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierObject copyWith({
    ActionEnum? action,
    Deposit? deposit,
  }) =>
      CashierObject(
        action: action ?? this.action,
        deposit: deposit ?? this.deposit,
      );
}
/// Deposit model class.
abstract class DepositModel {
  /// Initializes.
  DepositModel({
    this.address,
  });

  /// Address for crypto deposit.
  final String? address;
}

/// Deposit class.
class Deposit extends DepositModel {
  /// Initializes
  Deposit({
    String? address,
  }) : super(
          address: address,
        );

  /// Creates an instance from JSON
  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        address: json['address'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address'] = address;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Deposit copyWith({
    String? address,
  }) =>
      Deposit(
        address: address ?? this.address,
      );
}
