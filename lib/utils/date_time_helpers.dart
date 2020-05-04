part of 'helpers.dart';

/// Fetches the device time
int getCurrentLocalEpoch() =>
    (DateTime.now().millisecondsSinceEpoch / 1000).round();

/// Calculates the server time
DateTime getCurrentServerTime(int timeDifference) =>
    DateTime.fromMillisecondsSinceEpoch(
      (getCurrentLocalEpoch() + timeDifference) * 1000,
    );

/// Create a [DateTime] from time given in seconds
DateTime getDateTime(int timeInSeconds) => timeInSeconds == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(timeInSeconds * 1000);

/// Create a [DateTime] from time given string in seconds
DateTime getDateTimeFromString(String timeInSeconds) => timeInSeconds == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(int.parse(timeInSeconds) * 1000);
