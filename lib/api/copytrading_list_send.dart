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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CopytradingListRequest(
        copytradingList: copytradingList ?? this.copytradingList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
