/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_country_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p country list request class.
class P2pCountryListRequest extends Request {
  /// Initialize P2pCountryListRequest.
  const P2pCountryListRequest({
    this.country,
    this.loginid,
    this.p2pCountryList = true,
    super.msgType = 'p2p_country_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pCountryListRequest.fromJson(Map<String, dynamic> json) =>
      P2pCountryListRequest(
        country: json['country'] as String?,
        loginid: json['loginid'] as String?,
        p2pCountryList: json['p2p_country_list'] == null
            ? null
            : json['p2p_country_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] 2-letter country code. If not provided all countries are returned.
  final String? country;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pCountryList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'loginid': loginid,
        'p2p_country_list': p2pCountryList == null
            ? null
            : p2pCountryList!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pCountryListRequest copyWith({
    String? country,
    String? loginid,
    bool? p2pCountryList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pCountryListRequest(
        country: country ?? this.country,
        loginid: loginid ?? this.loginid,
        p2pCountryList: p2pCountryList ?? this.p2pCountryList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
