/// generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'p2p_advert_update_receive.g.dart';

/// JSON conversion for 'p2p_advert_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertUpdateResponse extends Response {
  /// Initialize P2pAdvertUpdateResponse
  const P2pAdvertUpdateResponse({
    this.p2pAdvertUpdate,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
