/// Forward starting option
class ForwardStartingOption {
  /// Initializes
  ForwardStartingOption(this.close, this.date, this.open);

  /// From Json
  factory ForwardStartingOption.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOption(
        int.parse(json['close']),
        int.parse(json['date']),
        int.parse(json['open']),
      );

  /// The epoch value for the closing date of forward starting session.
  final int close;

  /// The epoch value for the date of forward starting session.
  final int date;

  /// The epoch value for the opening date of forward starting session.
  final int open;

  /// Clone a new instance
  ForwardStartingOption copyWith({int close, int date, int open}) =>
      ForwardStartingOption(
        close ?? this.close,
        date ?? this.date,
        open ?? this.open,
      );
}
