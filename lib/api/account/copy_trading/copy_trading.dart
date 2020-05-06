import 'package:flutter_deriv_api/api/account/models/copier_model.dart';
import 'package:flutter_deriv_api/api/account/models/copy_trading_model.dart';
import 'package:flutter_deriv_api/api/account/models/trader_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// CopyTrading class
class CopyTrading extends CopyTradingModel {
  /// Initializes
  CopyTrading({
    List<CopierModel> copiers,
    List<TraderModel> traders,
  }) : super(
          copiers: copiers,
          traders: traders,
        );

  /// Creates an instance from JSON
  factory CopyTrading.fromJson(Map<String, dynamic> json) => CopyTrading(
        copiers: getListFromMap(
          json['copiers'],
          itemToTypeCallback: (dynamic item) => CopierModel.fromJson(item),
        ),
        traders: getListFromMap(
          json['traders'],
          itemToTypeCallback: (dynamic item) => TraderModel.fromJson(item),
        ),
      );

  /// Generate a copy of instance with given parameters
  CopyTrading copyWith({
    List<CopierModel> copiers,
    List<TraderModel> traders,
  }) =>
      CopyTrading(
        copiers: copiers ?? this.copiers,
        traders: traders ?? this.traders,
      );

  /// list of active copiers and/or traders for Copy Trading
  static Future<CopyTrading> getList() async => null;
}
