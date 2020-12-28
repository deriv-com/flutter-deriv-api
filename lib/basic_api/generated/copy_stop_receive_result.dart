/// Copy stop receive model class
abstract class CopyStopReceiveModel {
  /// Initializes
  CopyStopReceiveModel({
    @required this.copyStop,
  });

  /// Copy stopping confirmation. Returns 1 is success.
  final int copyStop;
}

/// Copy stop receive class
class CopyStopReceive extends CopyStopReceiveModel {
  /// Initializes
  CopyStopReceive({
    @required int copyStop,
  }) : super(
          copyStop: copyStop,
        );

  /// Creates an instance from JSON
  factory CopyStopReceive.fromJson(Map<String, dynamic> json) =>
      CopyStopReceive(
        copyStop: json['copy_stop'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copy_stop'] = copyStop;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopyStopReceive copyWith({
    int copyStop,
  }) =>
      CopyStopReceive(
        copyStop: copyStop ?? this.copyStop,
      );
}
