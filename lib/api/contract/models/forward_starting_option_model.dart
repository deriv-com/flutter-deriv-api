import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Forward starting option
class ForwardStartingOptionModel extends APIBaseModel {
  /// Initializes
  ForwardStartingOptionModel({
    this.close,
    this.date,
    this.open,
  });

  /// Generate an instance from JSON
  factory ForwardStartingOptionModel.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOptionModel(
        close: json['close'] = getDateTime(int.parse(json['close'])),
        date: json['date'] = getDateTime(int.parse(json['date'])),
        open: json['open'] = getDateTime(int.parse(json['open'])),
      );

  /// The epoch value for the closing date of forward starting session.
  final DateTime? close;

  /// The epoch value for the date of forward starting session.
  final DateTime? date;

  /// The epoch value for the opening date of forward starting session.
  final DateTime? open;

  /// Generate a copy of instance with given parameters
  ForwardStartingOptionModel copyWith({int? close, int? date, int? open}) =>
      ForwardStartingOptionModel(
        close: close as DateTime? ?? this.close,
        date: date as DateTime? ?? this.date,
        open: open as DateTime? ?? this.open,
      );
}
