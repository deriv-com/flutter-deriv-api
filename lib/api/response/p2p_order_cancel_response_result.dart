// ignore_for_file: prefer_single_quotes

import 'package:equatable/equatable.dart';


/// P2p order cancel response model class.
abstract class P2pOrderCancelResponseModel extends Equatable {
  /// Initializes P2p order cancel response model class .
  const P2pOrderCancelResponseModel({
    this.p2pOrderCancel,
  });

  /// Cancellation details
  final P2pOrderCancel? p2pOrderCancel;
}

/// P2p order cancel response class.
class P2pOrderCancelResponse extends P2pOrderCancelResponseModel {
  /// Initializes P2p order cancel response class.
  const P2pOrderCancelResponse({
    P2pOrderCancel? p2pOrderCancel,
  }) : super(
          p2pOrderCancel: p2pOrderCancel,
        );

  /// Creates an instance from JSON.
  factory P2pOrderCancelResponse.fromJson(
    dynamic p2pOrderCancelJson,
  ) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: p2pOrderCancelJson == null
            ? null
            : P2pOrderCancel.fromJson(p2pOrderCancelJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderCancel != null) {
      resultMap['p2p_order_cancel'] = p2pOrderCancel!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderCancelResponse copyWith({
    P2pOrderCancel? p2pOrderCancel,
  }) =>
      P2pOrderCancelResponse(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "cancelled": StatusEnum.cancelled,
};

/// Status Enum.
enum StatusEnum {
  /// cancelled.
  cancelled,
}
/// P2p order cancel model class.
abstract class P2pOrderCancelModel extends Equatable {
  /// Initializes P2p order cancel model class .
  const P2pOrderCancelModel({
    required this.status,
    required this.id,
  });

  /// The new status of the order.
  final StatusEnum status;

  /// The unique identifier for the order.
  final String id;
}

/// P2p order cancel class.
class P2pOrderCancel extends P2pOrderCancelModel {
  /// Initializes P2p order cancel class.
  const P2pOrderCancel({
    required String id,
    required StatusEnum status,
  }) : super(
          id: id,
          status: status,
        );

  /// Creates an instance from JSON.
  factory P2pOrderCancel.fromJson(Map<String, dynamic> json) => P2pOrderCancel(
        id: json['id'],
        status: statusEnumMapper[json['status']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderCancel copyWith({
    required String id,
    required StatusEnum status,
  }) =>
      P2pOrderCancel(
        id: id,
        status: status,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
