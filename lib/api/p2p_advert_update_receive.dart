/// generated automatically from flutter_deriv_api|lib/api/p2p_advert_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'p2p_advert_update_receive.g.dart';

/// JSON conversion for 'p2p_advert_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class P2pAdvertUpdateResponse extends Response {
  /// Initialize P2pAdvertUpdateResponse
  P2pAdvertUpdateResponse({
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
}
