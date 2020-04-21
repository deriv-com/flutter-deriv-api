/// Get date time from second since epoch
DateTime getDateTimeFromSeconds(int seconds) =>
    getDateTimeFromMilliseconds(seconds == null ? null : seconds * 1000);

/// Get date time from millisecond since epoch
DateTime getDateTimeFromMilliseconds(int milliseconds) => milliseconds == null
    ? null
    : DateTime.fromMillisecondsSinceEpoch(milliseconds);
