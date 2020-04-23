import 'package:flutter_deriv_api/api/models/copier_model.dart';
import 'package:flutter_deriv_api/api/models/copy_trading_model.dart';
import 'package:flutter_deriv_api/api/models/trader_model.dart';

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

  /// From JSON
  factory CopyTrading.fromJson(Map<String, dynamic> json) => CopyTrading(
        copiers: json['copiers'] != null
            ? json['copiers']
                .map<CopierModel>(
                    (dynamic entry) => CopierModel.fromJson(entry))
                .toList()
            : null,
        traders: json['traders'] != null
            ? json['traders']
                .map<TraderModel>(
                    (dynamic entry) => TraderModel.fromJson(entry))
                .toList()
            : null,
      );

  /// Clones a new instance
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
