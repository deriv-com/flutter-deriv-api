/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Asset index send class
class AssetIndexSend extends Request {
  /// Initialize AssetIndexSend
  const AssetIndexSend({
    this.assetIndex = true,
    this.landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'asset_index',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AssetIndexSend.fromJson(Map<String, dynamic> json) => AssetIndexSend(
        assetIndex:
            json['asset_index'] == null ? null : json['asset_index'] == 1,
        landingCompany: json['landing_company'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool assetIndex;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'asset_index': assetIndex == null
            ? null
            : assetIndex
                ? 1
                : 0,
        'landing_company': landingCompany,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AssetIndexSend copyWith({
    bool assetIndex,
    String landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AssetIndexSend(
        assetIndex: assetIndex ?? this.assetIndex,
        landingCompany: landingCompany ?? this.landingCompany,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
