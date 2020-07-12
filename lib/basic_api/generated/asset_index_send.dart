/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_send.json

import '../request.dart';

/// AssetIndexRequest class
class AssetIndexRequest extends Request {
  /// Initialize AssetIndexRequest
  const AssetIndexRequest({
    this.assetIndex = 1,
    this.landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'asset_index',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AssetIndexRequest.fromJson(Map<String, dynamic> json) =>
      AssetIndexRequest(
        // ignore: avoid_as
        assetIndex: json['asset_index'] as int,
        // ignore: avoid_as
        landingCompany: json['landing_company'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int assetIndex;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'asset_index': assetIndex,
        'landing_company': landingCompany,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AssetIndexRequest copyWith({
    int assetIndex,
    String landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AssetIndexRequest(
        assetIndex: assetIndex ?? this.assetIndex,
        landingCompany: landingCompany ?? this.landingCompany,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
