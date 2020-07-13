/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_list_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Copytrading list request class
class CopytradingListRequest extends Request {
  /// Initialize CopytradingListRequest
  const CopytradingListRequest({
    this.copytradingList = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'copytrading_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopytradingListRequest.fromJson(Map<String, dynamic> json) =>
      CopytradingListRequest(
        copytradingList: json['copytrading_list'] == null
            ? null
            : json['copytrading_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool copytradingList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_list':
            copytradingList == null ? null : copytradingList ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingListRequest copyWith({
    bool copytradingList,
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
