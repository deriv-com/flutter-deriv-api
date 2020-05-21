/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_login_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'mt5_login_list_receive.g.dart';

/// JSON conversion for 'mt5_login_list_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class Mt5LoginListResponse extends Response {
  /// Initialize Mt5LoginListResponse
  const Mt5LoginListResponse({
    this.mt5LoginList,
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
  factory Mt5LoginListResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5LoginListResponseFromJson(json);

  /// Array containing MT5 account objects.
  final List<Map<String, dynamic>> mt5LoginList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5LoginListResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  Mt5LoginListResponse copyWith({
    List<Map<String, dynamic>> mt5LoginList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
