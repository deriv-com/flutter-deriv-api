// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_confirm_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_confirm_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p order confirm response model class.
abstract class P2pOrderConfirmResponseModel {
  /// Initializes P2p order confirm response model class .
  const P2pOrderConfirmResponseModel({
    this.p2pOrderConfirm,
  });

  /// Confirmation details
  final P2pOrderConfirm? p2pOrderConfirm;
}

/// P2p order confirm response class.
class P2pOrderConfirmResponse extends P2pOrderConfirmResponseModel {
  /// Initializes P2p order confirm response class.
  const P2pOrderConfirmResponse({
    P2pOrderConfirm? p2pOrderConfirm,
  }) : super(
          p2pOrderConfirm: p2pOrderConfirm,
        );

  /// Creates an instance from JSON.
  factory P2pOrderConfirmResponse.fromJson(
    dynamic p2pOrderConfirmJson,
  ) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirmJson == null
            ? null
            : P2pOrderConfirm.fromJson(p2pOrderConfirmJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderConfirm != null) {
      resultMap['p2p_order_confirm'] = p2pOrderConfirm!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Cancel a P2P order confirm.
  ///
  /// For parameters information refer to [P2pOrderConfirmRequest].
  /// Throws an [P2POrderException] if API response contains an error.
  static Future<P2pOrderConfirmReceive> confirmOrderRaw(
    P2pOrderConfirmRequest request,
  ) async {
    final P2pOrderConfirmReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Cancel a P2P order confirm.
  ///
  /// For parameters information refer to [P2pOrderConfirmRequest].
  /// Throws an [P2POrderException] if API response contains an error.
  static Future<P2pOrderConfirmResponse> confirmOrder(
    P2pOrderConfirmRequest request,
  ) async {
    final P2pOrderConfirmReceive response = await confirmOrderRaw(request);

    return P2pOrderConfirmResponse.fromJson(response.p2pOrderConfirm);
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderConfirmResponse copyWith({
    P2pOrderConfirm? p2pOrderConfirm,
  }) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
      );
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "buyer-confirmed": StatusEnum.buyerConfirmed,
  "completed": StatusEnum.completed,
};

/// Status Enum.
enum StatusEnum {
  /// buyer-confirmed.
  buyerConfirmed,

  /// completed.
  completed,
}

/// P2p order confirm model class.
abstract class P2pOrderConfirmModel {
  /// Initializes P2p order confirm model class .
  const P2pOrderConfirmModel({
    required this.id,
    this.dryRun,
    this.status,
  });

  /// The unique identifier for the order.
  final String id;

  /// The `dry_run` was successful.
  final int? dryRun;

  /// The new status of the order.
  final StatusEnum? status;
}

/// P2p order confirm class.
class P2pOrderConfirm extends P2pOrderConfirmModel {
  /// Initializes P2p order confirm class.
  const P2pOrderConfirm({
    required String id,
    int? dryRun,
    StatusEnum? status,
  }) : super(
          id: id,
          dryRun: dryRun,
          status: status,
        );

  /// Creates an instance from JSON.
  factory P2pOrderConfirm.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirm(
        id: json['id'],
        dryRun: json['dry_run'],
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['dry_run'] = dryRun;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderConfirm copyWith({
    String? id,
    int? dryRun,
    StatusEnum? status,
  }) =>
      P2pOrderConfirm(
        id: id ?? this.id,
        dryRun: dryRun ?? this.dryRun,
        status: status ?? this.status,
      );
}
