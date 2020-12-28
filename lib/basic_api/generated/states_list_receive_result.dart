/// States list receive model class
abstract class StatesListReceiveModel {
  /// Initializes
  StatesListReceiveModel({
    @required this.statesList,
  });

  /// List of states.
  final List<StatesList> statesList;
}

/// States list receive class
class StatesListReceive extends StatesListReceiveModel {
  /// Initializes
  StatesListReceive({
    @required List<StatesList> statesList,
  }) : super(
          statesList: statesList,
        );

  /// Creates an instance from JSON
  factory StatesListReceive.fromJson(Map<String, dynamic> json) =>
      StatesListReceive(
        statesList: json['states_list'] == null
            ? null
            : json['states_list']
                .map<StatesList>((dynamic item) => StatesList.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (statesList != null) {
      result['states_list'] = statesList.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  StatesListReceive copyWith({
    List<StatesList> statesList,
  }) =>
      StatesListReceive(
        statesList: statesList ?? this.statesList,
      );
}
/// States list model class
abstract class StatesListModel {
  /// Initializes
  StatesListModel({
    @required this.text,
    @required this.value,
  });

  /// The state name.
  final String text;

  /// The state code.
  final String value;
}

/// States list class
class StatesList extends StatesListModel {
  /// Initializes
  StatesList({
    @required String text,
    @required String value,
  }) : super(
          text: text,
          value: value,
        );

  /// Creates an instance from JSON
  factory StatesList.fromJson(Map<String, dynamic> json) => StatesList(
        text: json['text'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['text'] = text;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StatesList copyWith({
    String text,
    String value,
  }) =>
      StatesList(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
