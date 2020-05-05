import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Forward starting option
class ForwardStartingOptionModel extends APIBaseModel {
  /// Initializes
  ForwardStartingOptionModel(this.close, this.date, this.open);

  /// Generate an instance from json
  factory ForwardStartingOptionModel.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOptionModel(
        json['close'] = getDateTime(int.parse(json['close'])),
        json['date'] = getDateTime(int.parse(json['date'])),
        json['open'] = getDateTime(int.parse(json['open'])),
      );

  /// The epoch value for the closing date of forward starting session.
  final DateTime close;

  /// The epoch value for the date of forward starting session.
  final DateTime date;

  /// The epoch value for the opening date of forward starting session.
  final DateTime open;

  /// Generate a copy of instance with given parameters
  ForwardStartingOptionModel copyWith({int close, int date, int open}) =>
      ForwardStartingOptionModel(
        close ?? this.close,
        date ?? this.date,
        open ?? this.open,
      );
}
