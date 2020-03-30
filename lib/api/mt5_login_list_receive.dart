/// Autogenerated from flutter_deriv_api|lib/api/mt5_login_list_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'mt5_login_list_receive.g.dart';

/// JSON conversion for 'mt5_login_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5LoginListResponse extends Response {
  /// Initialize Mt5LoginListResponse
  Mt5LoginListResponse(
      {this.mt5LoginList,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory Mt5LoginListResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5LoginListResponseFromJson(json);

  // Properties
  /// Array containing MT5 account objects.
  List<Map<String, dynamic>> mt5LoginList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5LoginListResponseToJson(this);
}
