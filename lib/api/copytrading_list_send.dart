/// generated automatically from flutter_deriv_api|lib/api/copytrading_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'copytrading_list_send.g.dart';

/// JSON conversion for 'copytrading_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingListRequest extends Request {
  /// Initialize CopytradingListRequest
  const CopytradingListRequest({
    this.copytradingList = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory CopytradingListRequest.fromJson(Map<String, dynamic> json) =>
      _$CopytradingListRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int copytradingList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopytradingListRequest copyWith({
    int copytradingList,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      CopytradingListRequest(
        copytradingList: copytradingList ?? this.copytradingList,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
