/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_create_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advert_create_receive.g.dart';

/// JSON conversion for 'p2p_advert_create_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertCreateResponse extends Response {
  /// Initialize P2pAdvertCreateResponse
  P2pAdvertCreateResponse({
    this.p2pAdvertCreate,
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
  factory P2pAdvertCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$P2pAdvertCreateResponseFromJson(json);

  // Properties
  /// The information of the created P2P advert.
  final Map<String, dynamic> p2pAdvertCreate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$P2pAdvertCreateResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  P2pAdvertCreateResponse copyWith({
    Map<String, dynamic> p2pAdvertCreate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
