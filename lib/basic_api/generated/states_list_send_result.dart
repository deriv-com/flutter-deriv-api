/// States list send model class
abstract class StatesListSendModel {
  /// Initializes
  StatesListSendModel({
    @required this.statesList,
  });

  /// Client's 2-letter country code (obtained from `residence_list` call)
  final String statesList;
}

/// States list send class
class StatesListSend extends StatesListSendModel {
  /// Initializes
  StatesListSend({
    @required String statesList,
  }) : super(
          statesList: statesList,
        );

  /// Creates an instance from JSON
  factory StatesListSend.fromJson(Map<String, dynamic> json) => StatesListSend(
        statesList: json['states_list'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['states_list'] = statesList;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StatesListSend copyWith({
    String statesList,
  }) =>
      StatesListSend(
        statesList: statesList ?? this.statesList,
      );
}
