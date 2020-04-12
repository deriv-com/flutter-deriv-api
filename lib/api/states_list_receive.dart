/// generated automatically from flutter_deriv_api|lib/api/states_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'states_list_receive.g.dart';

/// JSON conversion for 'states_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class StatesListResponse extends Response {
  /// Initialize StatesListResponse
  StatesListResponse({
    this.statesList,
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
  factory StatesListResponse.fromJson(Map<String, dynamic> json) =>
      _$StatesListResponseFromJson(json);

  // Properties
  /// List of states.
  final List<Map<String, dynamic>> statesList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$StatesListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  StatesListResponse copyWith({
    List<Map<String, dynamic>> statesList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      StatesListResponse(
        statesList: statesList ?? this.statesList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
