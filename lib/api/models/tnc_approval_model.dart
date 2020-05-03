import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';

/// Terms & Conditions Approval
class TncApprovalModel extends APIBaseModel {
  /// Initializes
  TncApprovalModel({
    this.tncApproved,
  });

  /// Generates an instance from JSON
  factory TncApprovalModel.fromJson(Map<String, dynamic> json) =>
      TncApprovalModel(
        tncApproved: getBool(json['tnc_approval']),
      );

  /// Set terms and conditions true: success
  final bool tncApproved;

  /// Creates a copy of instance with given parameters
  TncApprovalModel copyWith({
    bool tncApproved,
  }) =>
      TncApprovalModel(
        tncApproved: tncApproved ?? this.tncApproved,
      );
}
