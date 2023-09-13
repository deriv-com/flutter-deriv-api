/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Asset index request class.
class AssetIndexRequest extends Request {
  /// Initialize AssetIndexRequest.
  const AssetIndexRequest({
    this.assetIndex = true,
    required this.landingCompany,
    this.landingCompanyShort,
    super.msgType = 'asset_index',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AssetIndexRequest.fromJson(Map<String, dynamic> json) =>
      AssetIndexRequest(
        assetIndex:
            json['asset_index'] == null ? null : json['asset_index'] == 1,
        landingCompany: json['landing_company'] as String?,
        landingCompanyShort: json['landing_company_short'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? assetIndex;

  /// Deprecated - replaced by landing_company_short.
  final String? landingCompany;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String? landingCompanyShort;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'asset_index': assetIndex == null
            ? null
            : assetIndex!
                ? 1
                : 0,
        'landing_company': landingCompany,
        'landing_company_short': landingCompanyShort,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AssetIndexRequest copyWith({
    bool? assetIndex,
    String? landingCompany,
    String? landingCompanyShort,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AssetIndexRequest(
        assetIndex: assetIndex ?? this.assetIndex,
        landingCompany: landingCompany ?? this.landingCompany,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
