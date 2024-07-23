part of '../schema_model.dart';

/// Hard coded data of models which needs to extend equatable.
const Map<String, List<String>> equatableProbs = <String, List<String>>{
  'proposal': <String>[
    'id',
    'askPrice',
    'commission',
    'dateExpiry',
    'multiplier',
    'cancellation',
    'limitOrder'
  ],
  'limit_order': <String>[
    'stopLoss',
    'stopOut',
    'takeProfit',
  ],
  'take_profit': <String>[
    'displayName',
    'orderAmount',
  ],
  'stop_loss': <String>[
    'displayName',
    'orderAmount',
  ],
  'stop_out': <String>[
    'displayName',
    'orderAmount',
  ],
  'cancellation': <String>[
    'askPrice',
    'dateExpiry',
  ],
};

StringBuffer _generateEquatableProps(SchemaModel schema) {
  final String schemaTitle = schema.schemaTitle;
  final StringBuffer result = StringBuffer();

  if (equatableProbs.containsKey(schemaTitle)) {
    final List<String> fields = equatableProbs[schemaTitle]!;

    result.write(
      '''
              /// Override equatable class.
              @override
              List<Object?> get props => <Object?>[${_getEquatableFieldsString(fields)},];
      ''',
    );
  }

  return result;
}

String _getEquatableFieldsString(List<String> fields) => fields.join(',');
