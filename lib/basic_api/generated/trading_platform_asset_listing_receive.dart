/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_asset_listing_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform asset listing receive class.
class TradingPlatformAssetListingReceive extends Response {
  /// Initialize TradingPlatformAssetListingReceive.
  const TradingPlatformAssetListingReceive({
    this.subscription,
    this.tradingPlatformAssetListing,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAssetListingReceive.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAssetListingReceive(
        subscription: json['subscription'] as Map<String, dynamic>?,
        tradingPlatformAssetListing:
            json['trading_platform_asset_listing'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Containing Trading asset objects.
  final Map<String, dynamic>? tradingPlatformAssetListing;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'subscription': subscription,
        'trading_platform_asset_listing': tradingPlatformAssetListing,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAssetListingReceive copyWith({
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? tradingPlatformAssetListing,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformAssetListingReceive(
        subscription: subscription ?? this.subscription,
        tradingPlatformAssetListing:
            tradingPlatformAssetListing ?? this.tradingPlatformAssetListing,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
