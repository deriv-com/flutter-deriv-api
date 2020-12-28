/// Copy stop send model class
abstract class CopyStopSendModel {
  /// Initializes
  CopyStopSendModel({
    @required this.copyStop,
  });

  /// API tokens identifying the accounts which needs not to be copied
  final String copyStop;
}

/// Copy stop send class
class CopyStopSend extends CopyStopSendModel {
  /// Initializes
  CopyStopSend({
    @required String copyStop,
  }) : super(
          copyStop: copyStop,
        );

  /// Creates an instance from JSON
  factory CopyStopSend.fromJson(Map<String, dynamic> json) => CopyStopSend(
        copyStop: json['copy_stop'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copy_stop'] = copyStop;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopyStopSend copyWith({
    String copyStop,
  }) =>
      CopyStopSend(
        copyStop: copyStop ?? this.copyStop,
      );
}
