/// Get account status send model class
abstract class GetAccountStatusSendModel {
  /// Initializes
  GetAccountStatusSendModel({
    @required this.getAccountStatus,
  });

  /// Must be `1`
  final int getAccountStatus;
}

/// Get account status send class
class GetAccountStatusSend extends GetAccountStatusSendModel {
  /// Initializes
  GetAccountStatusSend({
    @required int getAccountStatus,
  }) : super(
          getAccountStatus: getAccountStatus,
        );

  /// Creates an instance from JSON
  factory GetAccountStatusSend.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusSend(
        getAccountStatus: json['get_account_status'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['get_account_status'] = getAccountStatus;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetAccountStatusSend copyWith({
    int getAccountStatus,
  }) =>
      GetAccountStatusSend(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
      );
}
