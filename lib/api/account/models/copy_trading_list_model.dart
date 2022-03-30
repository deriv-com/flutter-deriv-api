import 'package:flutter_deriv_api/api/account/models/copier_model.dart';
import 'package:flutter_deriv_api/api/account/models/trader_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Copy trading list model class
abstract class CopyTradingListModel extends APIBaseModel {
  /// Initializes
  CopyTradingListModel({
    this.copiers,
    this.traders,
  });

  /// List of users who are currently copy trading the authenticated user
  final List<CopierModel?>? copiers;

  /// List of traders being followed by the authenticated user
  final List<TraderModel?>? traders;
}
