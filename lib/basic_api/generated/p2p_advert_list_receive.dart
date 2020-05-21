/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advert_list_receive.g.dart';

/// JSON conversion for 'p2p_advert_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertListResponse extends Response {
  /// Initialize P2pAdvertListResponse
  const P2pAdvertListResponse({
    this.p2pAdvertList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory P2pAdvertListResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertListResponseFromJson(json);

  /// P2P adverts list.
  final Map<String, dynamic> p2pAdvertList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertListResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertListResponse copyWith({
    Map<String, dynamic> p2pAdvertList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertListResponse(
        p2pAdvertList: p2pAdvertList ?? this.p2pAdvertList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
