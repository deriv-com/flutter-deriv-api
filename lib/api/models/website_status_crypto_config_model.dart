import 'base_model.dart';

/// Crypto currencies information
class WebsiteStatusCryptoConfigModel extends BaseModel {
  /// Initializes
  WebsiteStatusCryptoConfigModel(this.code, this.minimumWithdrawal);

  /// Initialized from map
  factory WebsiteStatusCryptoConfigModel.fromMap(
    String code,
    Map<String, dynamic> json,
  ) =>
      WebsiteStatusCryptoConfigModel(
        code,
        json['minimum_withdrawal']?.toDouble(),
      );

  /// Crypto-currency code
  final String code;

  /// Minimum withdrawal for the currency in USD.
  final double minimumWithdrawal;

  /// Clones a new instance
  WebsiteStatusCryptoConfigModel copyWith({
    String code,
    double minimumWithdrawal,
  }) =>
      WebsiteStatusCryptoConfigModel(
        code ?? this.code,
        minimumWithdrawal ?? this.minimumWithdrawal,
      );
}
