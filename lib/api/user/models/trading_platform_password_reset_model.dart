/// Trading platform reset password model class
abstract class TradingPlatformPasswordResetModel {
  /// Initializes
  TradingPlatformPasswordResetModel({
    required this.tradingPlatformPasswordReset,
  });

  /// If set to `true`, the password has been reset.
  final bool tradingPlatformPasswordReset;
}
