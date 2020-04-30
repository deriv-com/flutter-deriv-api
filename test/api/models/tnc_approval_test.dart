import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/tnc_approval_model.dart';
import 'tnc_approval_mock_data.dart';

void main() {
  test('TnC approval JSON parsing', () {
    final TncApprovalModel tncApprovalModel =
        TncApprovalModel.fromJson(jsonDecode(tncApprovalJSON));
    expect(tncApprovalModel.tncApproved, true);
  });
}
