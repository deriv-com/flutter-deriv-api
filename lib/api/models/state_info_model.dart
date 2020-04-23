/// States list model class
class StatesInfoModel {
  /// Class constructor
  StatesInfoModel({
    this.text,
    this.value,
  });

  /// Creates instance from json
  factory StatesInfoModel.fromJson(Map<String, dynamic> json) =>
      StatesInfoModel(
        text: json['text'],
        value: json['value'],
      );

  /// The state name.
  final String text;

  /// The state code.
  final String value;

  /// Clones a new instance
  StatesInfoModel copyWith({
    String text,
    String value,
  }) =>
      StatesInfoModel(
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
