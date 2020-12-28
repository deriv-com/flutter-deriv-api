/// Paymentagent withdraw send model class
abstract class PaymentagentWithdrawSendModel {
  /// Initializes
  PaymentagentWithdrawSendModel({
    @required this.paymentagentWithdraw,
    @required this.amount,
    @required this.currency,
    this.description,
    this.dryRun,
    @required this.paymentagentLoginid,
    @required this.verificationCode,
  });

  /// Must be `1`
  final int paymentagentWithdraw;

  /// The amount to withdraw to the payment agent.
  final double amount;

  /// The currency code.
  final String currency;

  /// [Optional] Remarks about the withdraw. Only letters, numbers, space, period, comma, - ' are allowed.
  final String description;

  /// [Optional] If set to `true`, just do validation.
  final bool dryRun;

  /// The payment agent loginid received from the `paymentagent_list` call.
  final String paymentagentLoginid;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;
}

/// Paymentagent withdraw send class
class PaymentagentWithdrawSend extends PaymentagentWithdrawSendModel {
  /// Initializes
  PaymentagentWithdrawSend({
    @required int paymentagentWithdraw,
    @required double amount,
    @required String currency,
    String description,
    bool dryRun,
    @required String paymentagentLoginid,
    @required String verificationCode,
  }) : super(
          paymentagentWithdraw: paymentagentWithdraw,
          amount: amount,
          currency: currency,
          description: description,
          dryRun: dryRun,
          paymentagentLoginid: paymentagentLoginid,
          verificationCode: verificationCode,
        );

  /// Creates an instance from JSON
  factory PaymentagentWithdrawSend.fromJson(Map<String, dynamic> json) =>
      PaymentagentWithdrawSend(
        paymentagentWithdraw: json['paymentagent_withdraw'],
        amount: getDouble(json['amount']),
        currency: json['currency'],
        description: json['description'],
        dryRun: getBool(json['dry_run']),
        paymentagentLoginid: json['paymentagent_loginid'],
        verificationCode: json['verification_code'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['paymentagent_withdraw'] = paymentagentWithdraw;
    result['amount'] = amount;
    result['currency'] = currency;
    result['description'] = description;
    result['dry_run'] = dryRun;
    result['paymentagent_loginid'] = paymentagentLoginid;
    result['verification_code'] = verificationCode;

    return result;
  }

  /// Creates a copy of instance with given parameters
  PaymentagentWithdrawSend copyWith({
    int paymentagentWithdraw,
    double amount,
    String currency,
    String description,
    bool dryRun,
    String paymentagentLoginid,
    String verificationCode,
  }) =>
      PaymentagentWithdrawSend(
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        verificationCode: verificationCode ?? this.verificationCode,
      );
}
