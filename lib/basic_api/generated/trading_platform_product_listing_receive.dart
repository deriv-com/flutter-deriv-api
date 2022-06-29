/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_product_listing_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading platform product listing receive class.
class TradingPlatformProductListingReceive extends Response {
  /// Initialize TradingPlatformProductListingReceive.
  const TradingPlatformProductListingReceive({
    this.tradingPlatformProductListing,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformProductListingReceive.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformProductListingReceive(
        tradingPlatformProductListing:
            json['trading_platform_product_listing'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Containing Trading product objects.
  final Map<String, dynamic>? tradingPlatformProductListing;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_platform_product_listing': tradingPlatformProductListing,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformProductListingReceive copyWith({
    Map<String, dynamic>? tradingPlatformProductListing,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingPlatformProductListingReceive(
        tradingPlatformProductListing:
            tradingPlatformProductListing ?? this.tradingPlatformProductListing,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
