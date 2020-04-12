/// generated automatically from flutter_deriv_api|lib/api/mt5_login_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_login_list_receive.g.dart';

/// JSON conversion for 'mt5_login_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5LoginListResponse extends Response {
  /// Initialize Mt5LoginListResponse
  Mt5LoginListResponse({
    this.mt5LoginList,
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
  factory Mt5LoginListResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5LoginListResponseFromJson(json);

  // Properties
  /// Array containing MT5 account objects.
  final List<Map<String, dynamic>> mt5LoginList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5LoginListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  Mt5LoginListResponse copyWith({
    List<Map<String, dynamic>> mt5LoginList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
