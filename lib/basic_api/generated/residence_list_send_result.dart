/// Residence list send model class
abstract class ResidenceListSendModel {
  /// Initializes
  ResidenceListSendModel({
    @required this.residenceList,
  });

  /// Must be `1`
  final int residenceList;
}

/// Residence list send class
class ResidenceListSend extends ResidenceListSendModel {
  /// Initializes
  ResidenceListSend({
    @required int residenceList,
  }) : super(
          residenceList: residenceList,
        );

  /// Creates an instance from JSON
  factory ResidenceListSend.fromJson(Map<String, dynamic> json) =>
      ResidenceListSend(
        residenceList: json['residence_list'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['residence_list'] = residenceList;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ResidenceListSend copyWith({
    int residenceList,
  }) =>
      ResidenceListSend(
        residenceList: residenceList ?? this.residenceList,
      );
}
