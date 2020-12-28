/// Asset index receive model class
abstract class AssetIndexReceiveModel {
  /// Initializes
  AssetIndexReceiveModel({
    @required this.assetIndex,
  });

  /// List of underlyings by their display name and symbol followed by their available contract types and duration boundaries.
  final List<dynamic> assetIndex;
}

/// Asset index receive class
class AssetIndexReceive extends AssetIndexReceiveModel {
  /// Initializes
  AssetIndexReceive({
    @required List<dynamic> assetIndex,
  }) : super(
          assetIndex: assetIndex,
        );

  /// Creates an instance from JSON
  factory AssetIndexReceive.fromJson(Map<String, dynamic> json) =>
      AssetIndexReceive();

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['asset_index'] = assetIndex;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AssetIndexReceive copyWith({
    List<dynamic> assetIndex,
  }) =>
      AssetIndexReceive(
        assetIndex: assetIndex ?? this.assetIndex,
      );
}
