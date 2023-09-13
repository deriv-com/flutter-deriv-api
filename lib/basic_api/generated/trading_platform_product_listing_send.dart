/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_product_listing_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform product listing request class.
class TradingPlatformProductListingRequest extends Request {
  /// Initialize TradingPlatformProductListingRequest.
  const TradingPlatformProductListingRequest({
    this.appId,
    required this.countryCode,
    this.tradingPlatformProductListing = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'trading_platform_product_listing',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformProductListingRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformProductListingRequest(
        appId: (json['app_id'] as List<dynamic>?)
            ?.map<int>((dynamic item) => item as int)
            .toList(),
        countryCode: json['country_code'] as String?,
        tradingPlatformProductListing:
            json['trading_platform_product_listing'] == null
                ? null
                : json['trading_platform_product_listing'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Specific application `app_id`.
  final List<int>? appId;

  /// Country of legal citizenship, 2-letter country code.
  final String? countryCode;

  /// Must be `true`.
  final bool? tradingPlatformProductListing;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_id': appId,
        'country_code': countryCode,
        'trading_platform_product_listing':
            tradingPlatformProductListing == null
                ? null
                : tradingPlatformProductListing!
                    ? 1
                    : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformProductListingRequest copyWith({
    List<int>? appId,
    String? countryCode,
    bool? tradingPlatformProductListing,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformProductListingRequest(
        appId: appId ?? this.appId,
        countryCode: countryCode ?? this.countryCode,
        tradingPlatformProductListing:
            tradingPlatformProductListing ?? this.tradingPlatformProductListing,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
