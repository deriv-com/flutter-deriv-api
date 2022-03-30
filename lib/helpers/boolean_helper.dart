/// Converts int to boolean
bool? getBool(int? value) => value == null ? null : value == 1;

/// Converts boolean to int
int? getInt({bool? value}) => value == null ? null : value ? 1 : 0;
