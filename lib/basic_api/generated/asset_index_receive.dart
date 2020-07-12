/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// AssetIndexResponse class
class AssetIndexResponse extends Response {
  /// Initialize AssetIndexResponse
  const AssetIndexResponse({
    this.assetIndex,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AssetIndexResponse.fromJson(Map<String, dynamic> json) =>
      AssetIndexResponse(
        assetIndex: (json['asset_index'] as List)
            ?.map((dynamic item) => item as dynamic)
            ?.toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// List of underlyings by their display name and symbol followed by their available contract types and duration boundaries.
  final List<dynamic> assetIndex;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'asset_index': assetIndex,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AssetIndexResponse copyWith({
    List<dynamic> assetIndex,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AssetIndexResponse(
        assetIndex: assetIndex ?? this.assetIndex,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
