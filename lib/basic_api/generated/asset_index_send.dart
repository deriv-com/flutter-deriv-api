/// generated automatically from flutter_deriv_api|lib/basic_api/generated/asset_index_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'asset_index_send.g.dart';

/// JSON conversion for 'asset_index_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
