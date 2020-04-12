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
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      CopytradingListResponse(
        copytradingList: copytradingList ?? this.copytradingList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
