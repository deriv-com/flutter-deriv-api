/// generated automatically from flutter_deriv_api|lib/api/asset_index_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'asset_index_send.g.dart';

/// JSON conversion for 'asset_index_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AssetIndexRequest extends Request {
  /// Initialize AssetIndexRequest
  const AssetIndexRequest({
    this.assetIndex = 1,
    this.landingCompany,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory AssetIndexRequest.fromJson(Map<String, dynamic> json) =>
      _$AssetIndexRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int assetIndex;

  /// [Optional] If specified, will return only the underlyings for the specified landing company.
  final String landingCompany;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AssetIndexRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AssetIndexRequest copyWith({
    int assetIndex,
    String landingCompany,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      AssetIndexRequest(
        assetIndex: assetIndex ?? this.assetIndex,
        landingCompany: landingCompany ?? this.landingCompany,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
