// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tnc_approval_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TncApprovalRequest _$TncApprovalRequestFromJson(Map<String, dynamic> json) {
  return TncApprovalRequest()
    ..tncApproval = json['tnc_approval'] as num
    ..ukgcFundsProtection = json['ukgc_funds_protection'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TncApprovalRequestToJson(TncApprovalRequest instance) =>
    <String, dynamic>{
      'tnc_approval': instance.tncApproval,
      'ukgc_funds_protection': instance.ukgcFundsProtection,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
