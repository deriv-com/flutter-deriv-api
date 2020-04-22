import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Forward starting option
class ForwardStartingOptionModel extends BaseModel {
  /// Initializes
  ForwardStartingOptionModel(this.close, this.date, this.open);

  /// From Json
  factory ForwardStartingOptionModel.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOptionModel(
        json['close'] != null ? getDateTime(int.parse(json['close'])) : null,
        json['date'] != null ? getDateTime(int.parse(json['date'])) : null,
        json['open'] != null ? getDateTime(int.parse(json['open'])) : null,
      );

  /// The epoch value for the closing date of forward starting session.
  final DateTime close;

  /// The epoch value for the date of forward starting session.
  final DateTime date;

  /// The epoch value for the opening date of forward starting session.
  final DateTime open;

  /// Clones a new instance
  ForwardStartingOptionModel copyWith({int close, int date, int open}) =>
      ForwardStartingOptionModel(
        close ?? this.close,
        date ?? this.date,
        open ?? this.open,
      );
}
