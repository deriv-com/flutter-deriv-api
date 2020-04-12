/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advert_update_receive.g.dart';

/// JSON conversion for 'p2p_advert_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertUpdateResponse extends Response {
  /// Initialize P2pAdvertUpdateResponse
  const P2pAdvertUpdateResponse({
    this.p2pAdvertUpdate,
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
  factory P2pAdvertUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertUpdateResponseFromJson(json);

  // Properties
  /// P2P updated advert information.
  final Map<String, dynamic> p2pAdvertUpdate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertUpdateResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertUpdateResponse copyWith({
    Map<String, dynamic> p2pAdvertUpdate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
