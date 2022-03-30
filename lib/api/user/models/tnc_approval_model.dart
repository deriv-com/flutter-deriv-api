import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Terms and conditions approval model class
abstract class TNCApprovalModel extends APIBaseModel {
  /// Initializes
  TNCApprovalModel({
    this.approved,
  });

  /// Set terms and conditions true: success
  final bool? approved;
}
