/// Copytrading list send model class
abstract class CopytradingListSendModel {
  /// Initializes
  CopytradingListSendModel({
    @required this.copytradingList,
  });

  /// Must be `1`
  final int copytradingList;
}

/// Copytrading list send class
class CopytradingListSend extends CopytradingListSendModel {
  /// Initializes
  CopytradingListSend({
    @required int copytradingList,
  }) : super(
          copytradingList: copytradingList,
        );

  /// Creates an instance from JSON
  factory CopytradingListSend.fromJson(Map<String, dynamic> json) =>
      CopytradingListSend(
        copytradingList: json['copytrading_list'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copytrading_list'] = copytradingList;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingListSend copyWith({
    int copytradingList,
  }) =>
      CopytradingListSend(
        copytradingList: copytradingList ?? this.copytradingList,
      );
}
