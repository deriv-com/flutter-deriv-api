import 'package:flutter_deriv_api/models/copy_trading.dart';

/// CopyTrading
class CopyTrading extends CopyTradingModel {
  /// Constructor
  CopyTrading({
    List<CopierModel> copiers,
    List<TraderModel> traders,
  }) : super(
          copiers: copiers,
          traders: traders,
        );

  /// Instance from JSON
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
}
