/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advert_list_receive.g.dart';

/// JSON conversion for 'p2p_advert_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertListResponse extends Response {
  /// Initialize P2pAdvertListResponse
  const P2pAdvertListResponse({
    this.p2pAdvertList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory P2pAdvertListResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertListResponseFromJson(json);

  // Properties
  /// P2P adverts list.
  final Map<String, dynamic> p2pAdvertList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertListResponse copyWith({
    Map<String, dynamic> p2pAdvertList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
