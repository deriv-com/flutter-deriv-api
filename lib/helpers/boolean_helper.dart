/// Converts int to boolean
bool getBool(dynamic value) =>
    value == null ? null : value == 1 || value == true;

/// Converts boolean to int
int getInt({bool value}) => value == null
    ? null
    : value
        ? 1
        : 0;
