/// Paymentagent list send model class
abstract class PaymentagentListSendModel {
  /// Initializes
  PaymentagentListSendModel({
    @required this.paymentagentList,
    this.currency,
  });

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String paymentagentList;

  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  final String currency;
}

/// Paymentagent list send class
class PaymentagentListSend extends PaymentagentListSendModel {
  /// Initializes
  PaymentagentListSend({
    @required String paymentagentList,
    String currency,
  }) : super(
          paymentagentList: paymentagentList,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory PaymentagentListSend.fromJson(Map<String, dynamic> json) =>
      PaymentagentListSend(
        paymentagentList: json['paymentagent_list'],
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['paymentagent_list'] = paymentagentList;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentListSend copyWith({
    String paymentagentList,
    String currency,
  }) =>
      PaymentagentListSend(
        paymentagentList: paymentagentList ?? this.paymentagentList,
        currency: currency ?? this.currency,
      );
}
