/// Copy start receive model class
abstract class CopyStartReceiveModel {
  /// Initializes
  CopyStartReceiveModel({
    @required this.copyStart,
  });

  /// Copy start confirmation. Returns 1 is success.
  final int copyStart;
}

/// Copy start receive class
class CopyStartReceive extends CopyStartReceiveModel {
  /// Initializes
  CopyStartReceive({
    @required int copyStart,
  }) : super(
          copyStart: copyStart,
        );

  /// Creates an instance from JSON
  factory CopyStartReceive.fromJson(Map<String, dynamic> json) =>
      CopyStartReceive(
        copyStart: json['copy_start'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copy_start'] = copyStart;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopyStartReceive copyWith({
    int copyStart,
  }) =>
      CopyStartReceive(
        copyStart: copyStart ?? this.copyStart,
      );
}
