import 'package:test/test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/helpers/enum_helper.dart';

void main() {
  group('getEnumName tests =>', () {
    test('should return formatted enum name.', () {
      final String result = getEnumName('enum_name');

      expect(result, 'enumName');
    });

    test('should handle special characters in enum name.', () {
      final String result = getEnumName('enum_name_123_&');

      expect(result, 'enumName123');
    });
  });

  group('getStringFromEnum tests =>', () {
    test('should return string from enum in snake case.', () {
      final String result = getStringFromEnum(EnumCase.snakeCase);

      expect(result, 'snake_case');
    });

    test('should return string from enum in param case.', () {
      final String result =
          getStringFromEnum(EnumCase.paramCase, enumCase: EnumCase.paramCase);

      expect(result, 'param-case');
    });

    test('should return string from enum in upper case.', () {
      final String result =
          getStringFromEnum(EnumCase.upperCase, enumCase: EnumCase.upperCase);

      expect(result, 'UPPERCASE');
    });

    test('should return empty string for null enum.', () {
      final String result = getStringFromEnum(null);

      expect(result, '');
    });
  });

  group('getEnumFromString tests =>', () {
    test('should return enum from string in snake case.', () {
      final EnumCase? result = getEnumFromString<EnumCase>(
        values: EnumCase.values,
        name: 'snake_case',
      );

      expect(result, EnumCase.snakeCase);
    });

    test('should return enum from string in param case.', () {
      final EnumCase? result = getEnumFromString<EnumCase>(
        values: EnumCase.values,
        name: 'param-case',
        enumCase: EnumCase.paramCase,
      );

      expect(result, EnumCase.paramCase);
    });

    test('should return enum from string in upper case.', () {
      final EnumCase? result = getEnumFromString<EnumCase>(
        values: EnumCase.values,
        name: 'UPPERCASE',
        enumCase: EnumCase.upperCase,
      );

      expect(result, EnumCase.upperCase);
    });

    test('should return null for unknown string.', () {
      final EnumCase? result = getEnumFromString<EnumCase>(
        values: EnumCase.values,
        name: 'unknown_case',
      );
      expect(result, null);
    });

    test('should return null for null string.', () {
      final EnumCase? result = getEnumFromString<EnumCase>(
        values: EnumCase.values,
        name: null,
      );

      expect(result, null);
    });
  });

  group('getStringListFromEnums tests =>', () {
    test('should return list of strings from list of enums in snake case.', () {
      final List<String> result = getStringListFromEnums<EnumCase>(
        EnumCase.values,
      );

      expect(result, <String>['snake_case', 'param_case', 'upper_case']);
    });

    test('should return list of strings from list of enums in param case.', () {
      final List<String> result = getStringListFromEnums<EnumCase>(
        EnumCase.values,
        enumCase: EnumCase.paramCase,
      );

      expect(result, <String>['snake-case', 'param-case', 'upper-case']);
    });

    test('should return list of strings from list of enums in upper case.', () {
      final List<String> result = getStringListFromEnums<EnumCase>(
        EnumCase.values,
        enumCase: EnumCase.upperCase,
      );

      expect(result, <String>['SNAKECASE', 'PARAMCASE', 'UPPERCASE']);
    });
  });

  group('getEnumListFromStrings tests =>', () {
    test('should return list of enums from list of strings in snake case.', () {
      final List<EnumCase?>? result = getEnumListFromStrings<EnumCase>(
        values: EnumCase.values,
        names: <String>['snake_case', 'param-case', 'UPPERCASE'],
      );

      expect(result, <EnumCase?>[EnumCase.snakeCase, null, null]);
    });

    test('should return list of enums from list of strings in param case.', () {
      final List<EnumCase?>? result = getEnumListFromStrings<EnumCase>(
        values: EnumCase.values,
        names: <String>['snake-case', 'param-case', 'UPPERCASE'],
        enumCase: EnumCase.paramCase,
      );

      expect(result, <EnumCase?>[EnumCase.snakeCase, EnumCase.paramCase, null]);
    });

    test('should return list of enums from list of strings in upper case.', () {
      final List<EnumCase?>? result = getEnumListFromStrings<EnumCase>(
        values: EnumCase.values,
        names: <String>['snake_case', 'param_case', 'UPPERCASE'],
        enumCase: EnumCase.upperCase,
      );

      expect(result, <EnumCase?>[null, null, EnumCase.upperCase]);
    });

    test('should return null for unknown strings.', () {
      final List<EnumCase?>? result = getEnumListFromStrings<EnumCase>(
        values: EnumCase.values,
        names: <String>['unknown_case'],
      );

      expect(result, <EnumCase?>[null]);
    });

    test('should return null for null strings.', () {
      final List<EnumCase?>? result = getEnumListFromStrings<EnumCase>(
        values: EnumCase.values,
        names: null,
      );

      expect(result, null);
    });
  });

  group('getEnumValueString tests =>', () {
    test('should return the enum value string.', () {
      final String result = getEnumValueString(EnumCase.snakeCase.toString());

      expect(result, 'snakeCase');
    });
  });

  group('EnumConverter tests =>', () {
    test('should convert string to AccountRiskClassification enum.', () {
      final AccountRiskClassification? result =
          'low'.toAccountRiskClassificationEnum;

      expect(result, AccountRiskClassification.low);
    });

    test('should convert string to VerificationType enum.', () {
      final VerificationType? result = 'document'.toVerificationTypeEnum;

      expect(result, VerificationType.document);
    });

    test('should convert string to AccountStatusType enum.', () {
      final AccountStatusType? result = 'disabled'.toAccountStatusTypeEnum;

      expect(result, AccountStatusType.disabled);
    });

    test('should convert string to ContractType enum.', () {
      final ContractType? result = 'CALLSPREAD'.toContractTypeEnum;

      expect(result, ContractType.callSpread);
    });
  });
}
