/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advert_info_receive.g.dart';

/// JSON conversion for 'p2p_advert_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertInfoResponse extends Response {
  /// Initialize P2pAdvertInfoResponse
  const P2pAdvertInfoResponse({
    this.p2pAdvertInfo,
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
  factory P2pAdvertInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertInfoResponseFromJson(json);

  // Properties
  /// P2P advert information.
  final Map<String, dynamic> p2pAdvertInfo;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertInfoResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertInfoResponse copyWith({
    Map<String, dynamic> p2pAdvertInfo,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
