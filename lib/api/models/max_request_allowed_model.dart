import 'api_base_model.dart';

/// Maximum number of requests allowed during specified period of time.
class MaxRequestAllowedModel extends APIBaseModel {
  /// Initializes
  MaxRequestAllowedModel({this.appliesTo, this.hourly, this.minutely});

  /// From Json
  factory MaxRequestAllowedModel.fromJson(
    Map<String, dynamic> item,
  ) =>
      MaxRequestAllowedModel(
        appliesTo: item['applies_to'],
        hourly: item['hourly'],
        minutely: item['minutely'],
      );

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// The maximum of allowed calls per hour.
  final int hourly;

  /// The maximum of allowed calls per minute.
  final int minutely;

  /// Clones a new instance
  MaxRequestAllowedModel copyWith({
    String appliesTo,
    int hourly,
    int minutely,
  }) =>
      MaxRequestAllowedModel(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}
