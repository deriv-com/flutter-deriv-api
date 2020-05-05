import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Crypto currencies information
class WebsiteStatusCryptoConfigModel extends APIBaseModel {
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

  /// Generates a copy of instance with given parameters
  WebsiteStatusCryptoConfigModel copyWith({
    String code,
    double minimumWithdrawal,
  }) =>
      WebsiteStatusCryptoConfigModel(
        code: code ?? this.code,
        minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      );
}
