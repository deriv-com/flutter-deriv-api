import 'base_model.dart';

/// Crypto currencies information
class WebsiteStatusCryptoConfigModel extends BaseModel {
  /// Initializes
  WebsiteStatusCryptoConfigModel({this.code, this.minimumWithdrawal});

  /// Initialized from map
  factory WebsiteStatusCryptoConfigModel.fromJson(
    String code,
    Map<String, dynamic> json,
  ) =>
      WebsiteStatusCryptoConfigModel(
        code: code,
        minimumWithdrawal: json['minimum_withdrawal']?.toDouble(),
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
        code: code ?? this.code,
        minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      );
}
