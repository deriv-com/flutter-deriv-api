// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// P2p ping response model class.
abstract class P2pPingResponseModel extends Equatable {
  /// Initializes P2p ping response model class .
  const P2pPingResponseModel({
    this.p2pPing,
  });

  /// Will return 'pong'
  final P2pPingEnum? p2pPing;
}

/// P2p ping response class.
class P2pPingResponse extends P2pPingResponseModel {
  /// Initializes P2p ping response class.
  const P2pPingResponse({
    P2pPingEnum? p2pPing,
  }) : super(
          p2pPing: p2pPing,
        );

  /// Creates an instance from JSON.
  factory P2pPingResponse.fromJson(
    dynamic p2pPingJson,
  ) =>
      P2pPingResponse(
        p2pPing: p2pPingJson == null ? null : p2pPingEnumMapper[p2pPingJson],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['p2p_ping'] = p2pPingEnumMapper.entries
        .firstWhere(
            (MapEntry<String, P2pPingEnum> entry) => entry.value == p2pPing)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pPingResponse copyWith({
    P2pPingEnum? p2pPing,
  }) =>
      P2pPingResponse(
        p2pPing: p2pPing ?? this.p2pPing,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// P2pPingEnum mapper.
final Map<String, P2pPingEnum> p2pPingEnumMapper = <String, P2pPingEnum>{
  "pong": P2pPingEnum.pong,
};

/// P2pPing Enum.
enum P2pPingEnum {
  /// pong.
  pong,
}
