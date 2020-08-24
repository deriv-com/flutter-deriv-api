import 'dart:convert';
import 'dart:io';

import 'package:flutter_deriv_api/tools/json_schema_parser.dart';

void main(List<String> arguments) {
  if (arguments.length < 2) {
    throw Exception('Invalid arguments.');
  }

  final List<StringBuffer> result = JsonSchemaParser().getClasses(
    models: JsonSchemaParser.getModels(
      schema: json.decode(
        File(arguments.first).readAsStringSync(),
      ),
    ),
    className: arguments.last,
  );

  final File output = File('${arguments.first.split('.').first}_result.dart');

  for (final StringBuffer item in result) {
    output.writeAsStringSync('${item.toString()}', mode: FileMode.append);
  }
}
