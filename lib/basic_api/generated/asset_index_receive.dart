/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Asset index receive class.
class AssetIndexReceive extends Response {
  /// Initialize AssetIndexReceive.
  const AssetIndexReceive({
    this.assetIndex,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AssetIndexReceive.fromJson(Map<String, dynamic> json) =>
      AssetIndexReceive(
        assetIndex: json['asset_index'] as List<dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of underlyings by their display name and symbol followed by their available contract types and duration boundaries.
  final List<dynamic>? assetIndex;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'asset_index': assetIndex,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AssetIndexReceive copyWith({
    List<dynamic>? assetIndex,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AssetIndexReceive(
        assetIndex: assetIndex ?? this.assetIndex,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
