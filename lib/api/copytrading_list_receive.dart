/// generated automatically from flutter_deriv_api|lib/api/copytrading_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'copytrading_list_receive.g.dart';

/// JSON conversion for 'copytrading_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingListResponse extends Response {
  /// Initialize CopytradingListResponse
  const CopytradingListResponse({
    this.copytradingList,
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
  factory CopytradingListResponse.fromJson(Map<String, dynamic> json) =>
      _$CopytradingListResponseFromJson(json);

  // Properties
  /// The trading information of copiers or traders.
  final Map<String, dynamic> copytradingList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopytradingListResponse copyWith({
    Map<String, dynamic> copytradingList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopytradingListResponse(
        copytradingList: copytradingList ?? this.copytradingList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
