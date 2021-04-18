import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// P2P advertiser details model class
class P2PAdvertiserDetailsModel extends APIBaseModel {
  /// Initializes
  P2PAdvertiserDetailsModel({
    this.id,
    this.name,
  });

  /// Generate an instance from JSON
  factory P2PAdvertiserDetailsModel.fromJson(Map<String, dynamic> json) =>
      P2PAdvertiserDetailsModel(
        id: json['id'],
        name: json['name'],
      );

  /// The advertisers unique identifier.
  final String? id;

  /// The advertisers displayed name.
  final String? name;

  /// Generate a copy of instance with given parameters
  P2PAdvertiserDetailsModel copyWith({
    String? id,
    double? name,
  }) =>
      P2PAdvertiserDetailsModel(
        id: id ?? this.id,
        name: name.toString(),
      );
}
