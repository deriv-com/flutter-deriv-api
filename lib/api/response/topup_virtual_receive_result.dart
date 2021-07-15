import '../../basic_api/generated/topup_virtual_receive.dart';
import '../../basic_api/generated/topup_virtual_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Topup virtual response model class.
abstract class TopupVirtualResponseModel {
  /// Initializes Topup virtual response model class .
  TopupVirtualResponseModel({
    this.topupVirtual,
  });

  /// The information regarding a successful top up for a virtual money account
  final TopupVirtual? topupVirtual;
}

/// Topup virtual response class.
class TopupVirtualResponse extends TopupVirtualResponseModel {
  /// Initializes Topup virtual response class.
  TopupVirtualResponse({
    TopupVirtual? topupVirtual,
  }) : super(
          topupVirtual: topupVirtual,
        );

  /// Creates an instance from JSON.
  factory TopupVirtualResponse.fromJson(
    dynamic topupVirtualJson,
  ) =>
      TopupVirtualResponse(
        topupVirtual: topupVirtualJson == null
            ? null
            : TopupVirtual.fromJson(topupVirtualJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (topupVirtual != null) {
      resultMap['topup_virtual'] = topupVirtual!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Topes up the virtual-money's account balance becomes when it becomes low.
  ///
  /// For parameters information refer to [TopupVirtualRequest].
  /// Throws a [TopUpVirtualException] if API response contains an error
  static Future<TopupVirtualResponse> topUp([
    TopupVirtualRequest? request,
  ]) async {
    final TopupVirtualReceive response = await _api.call(
      request: request ?? const TopupVirtualRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TopUpVirtualException(baseExceptionModel: baseExceptionModel),
    );

    return TopupVirtualResponse.fromJson(response.topupVirtual);
  }

  /// Creates a copy of instance with given parameters.
  TopupVirtualResponse copyWith({
    TopupVirtual? topupVirtual,
  }) =>
      TopupVirtualResponse(
        topupVirtual: topupVirtual ?? this.topupVirtual,
      );
}
/// Topup virtual model class.
abstract class TopupVirtualModel {
  /// Initializes Topup virtual model class .
  TopupVirtualModel({
    this.amount,
    this.currency,
  });

  /// Top up amount
  final double? amount;

  /// Top up currency string
  final String? currency;
}

/// Topup virtual class.
class TopupVirtual extends TopupVirtualModel {
  /// Initializes Topup virtual class.
  TopupVirtual({
    double? amount,
    String? currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON.
  factory TopupVirtual.fromJson(Map<String, dynamic> json) => TopupVirtual(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TopupVirtual copyWith({
    double? amount,
    String? currency,
  }) =>
      TopupVirtual(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
