/// Mt5 login list send model class
abstract class Mt5LoginListSendModel {
  /// Initializes
  Mt5LoginListSendModel({
    @required this.mt5LoginList,
  });

  /// Must be `1`
  final int mt5LoginList;
}

/// Mt5 login list send class
class Mt5LoginListSend extends Mt5LoginListSendModel {
  /// Initializes
  Mt5LoginListSend({
    @required int mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListSend.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListSend(
        mt5LoginList: json['mt5_login_list'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['mt5_login_list'] = mt5LoginList;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListSend copyWith({
    int mt5LoginList,
  }) =>
      Mt5LoginListSend(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
}
