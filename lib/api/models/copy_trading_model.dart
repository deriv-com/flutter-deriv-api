import 'base_model.dart';
import 'copier_model.dart';
import 'trader_model.dart';

/// Abstract class for Copy trading calls
abstract class CopyTradingModel extends BaseModel {
  /// Initializes
  CopyTradingModel({
    this.copiers,
    this.traders,
  });

  /// List of users who are currently copy trading the authenticated user
  final List<CopierModel> copiers;

  /// List of traders being followed by the authenticated user
  final List<TraderModel> traders;
}
