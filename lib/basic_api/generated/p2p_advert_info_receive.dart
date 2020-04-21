/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_info_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advert_info_receive.g.dart';

/// JSON conversion for 'p2p_advert_info_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertInfoResponse extends Response {
  /// Initialize P2pAdvertInfoResponse
  const P2pAdvertInfoResponse({
    this.p2pAdvertInfo,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertInfoResponse(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
