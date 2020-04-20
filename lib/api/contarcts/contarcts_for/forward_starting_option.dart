import 'package:flutter_deriv_api/helpers.dart';

/// Forward starting option
class ForwardStartingOption {
  /// Initializes
  ForwardStartingOption(this.close, this.date, this.open);

  /// From Json
  factory ForwardStartingOption.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOption(
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

  /// Clone a new instance
  ForwardStartingOption copyWith({int close, int date, int open}) =>
      ForwardStartingOption(
        close ?? this.close,
        date ?? this.date,
        open ?? this.open,
      );
}
