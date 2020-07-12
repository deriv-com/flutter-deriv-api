/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_list_send.json

import '../request.dart';

/// CopytradingListRequest class
class CopytradingListRequest extends Request {
  /// Initialize CopytradingListRequest
  const CopytradingListRequest({
    this.copytradingList = 1,
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
        // ignore: avoid_as
        copytradingList: json['copytrading_list'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int copytradingList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_list': copytradingList,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
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
