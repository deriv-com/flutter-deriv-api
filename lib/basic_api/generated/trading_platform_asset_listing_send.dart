/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_asset_listing_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform asset listing request class.
class TradingPlatformAssetListingRequest extends Request {
  /// Initialize TradingPlatformAssetListingRequest.
  const TradingPlatformAssetListingRequest({
    this.loginid,
    required this.platform,
    required this.region,
    this.subscribe,
    this.tradingPlatformAssetListing = true,
    required this.type,
    super.msgType = 'trading_platform_asset_listing',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformAssetListingRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformAssetListingRequest(
        loginid: json['loginid'] as String?,
        platform: json['platform'] as String?,
        region: json['region'] as String?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        tradingPlatformAssetListing:
            json['trading_platform_asset_listing'] == null
                ? null
                : json['trading_platform_asset_listing'] == 1,
        type: json['type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Trading platform name
  final String? platform;

  /// Region be either 'eu' or 'row'.
  final String? region;

  /// [Optional] If set to `true`, will send updates whenever asset listing is updated.
  final bool? subscribe;

  /// Must be `true`
  final bool? tradingPlatformAssetListing;

  /// Can be either 'brief' or 'full'.
  final String? type;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'platform': platform,
        'region': region,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'trading_platform_asset_listing': tradingPlatformAssetListing == null
            ? null
            : tradingPlatformAssetListing!
                ? 1
                : 0,
        'type': type,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformAssetListingRequest copyWith({
    String? loginid,
    String? platform,
    String? region,
    bool? subscribe,
    bool? tradingPlatformAssetListing,
    String? type,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformAssetListingRequest(
        loginid: loginid ?? this.loginid,
        platform: platform ?? this.platform,
        region: region ?? this.region,
        subscribe: subscribe ?? this.subscribe,
        tradingPlatformAssetListing:
            tradingPlatformAssetListing ?? this.tradingPlatformAssetListing,
        type: type ?? this.type,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
