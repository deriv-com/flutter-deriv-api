import 'package:intl/intl.dart';

/// Fetches the device time
int getCurrentLocalEpoch() =>
    (DateTime.now().millisecondsSinceEpoch / 1000).round();

/// Calculates the server time
DateTime getCurrentServerTime(int timeDifference) =>
    DateTime.fromMillisecondsSinceEpoch(
      (getCurrentLocalEpoch() + timeDifference) * 1000,
    );

/// Creates a [DateTime] from time given in seconds
DateTime? getDateTime(int? timeInSeconds) => timeInSeconds == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(timeInSeconds * 1000);

/// Creates a [DateTime] from time given string in seconds
DateTime? getDateTimeFromString(String? timeInSeconds) =>
    getDateTime(timeInSeconds == null ? null : int.tryParse(timeInSeconds));

/// Gets seconds since epoch from milliseconds since epoch
int getSecondsSinceEpoch(int millisecondsSinceEpoch) =>
    (millisecondsSinceEpoch / 1000).round();

/// Gets seconds since epoch from date time object
int? getSecondsSinceEpochDateTime(DateTime? dateTime) => dateTime == null
    ? null
    : getSecondsSinceEpoch(dateTime.millisecondsSinceEpoch);

/// Gets a string from a [DateTime] object.
///
/// Default pattern is `yyyy-MM-dd`.
String? getStringFromDateTime(
  DateTime? dateTime, {
  String pattern = 'yyyy-MM-dd',
}) =>
    dateTime == null ? null : DateFormat(pattern).format(dateTime);
