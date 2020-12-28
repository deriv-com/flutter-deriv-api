/// Cancel send model class
abstract class CancelSendModel {
  /// Initializes
  CancelSendModel({
    @required this.cancel,
  });

  /// Value should be the `contract_id` which received from the `portfolio` call.
  final int cancel;
}

/// Cancel send class
class CancelSend extends CancelSendModel {
  /// Initializes
  CancelSend({
    @required int cancel,
  }) : super(
          cancel: cancel,
        );

  /// Creates an instance from JSON
  factory CancelSend.fromJson(Map<String, dynamic> json) => CancelSend(
        cancel: json['cancel'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['cancel'] = cancel;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CancelSend copyWith({
    int cancel,
  }) =>
      CancelSend(
        cancel: cancel ?? this.cancel,
      );
}
