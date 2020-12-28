/// Portfolio send model class
abstract class PortfolioSendModel {
  /// Initializes
  PortfolioSendModel({
    @required this.portfolio,
    @required this.contractType,
  });

  /// Must be `1`
  final int portfolio;

  /// Return only contracts of the specified types
  final List<ContractTypeEnum> contractType;
}

/// Portfolio send class
class PortfolioSend extends PortfolioSendModel {
  /// Initializes
  PortfolioSend({
    @required int portfolio,
    @required List<ContractTypeEnum> contractType,
  }) : super(
          portfolio: portfolio,
          contractType: contractType,
        );

  /// Creates an instance from JSON
  factory PortfolioSend.fromJson(Map<String, dynamic> json) => PortfolioSend(
        portfolio: json['portfolio'],
        contractType: List<ContractTypeEnum>.from(json['contract_type'].map(
            (x) => contractTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == x, orElse: () => null)
                ?.key)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['portfolio'] = portfolio;
    if (contractType != null) {
      result['contract_type'] =
          contractType.map((item) => contractTypeEnumMapper[item]).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  PortfolioSend copyWith({
    int portfolio,
    List<ContractTypeEnum> contractType,
  }) =>
      PortfolioSend(
        portfolio: portfolio ?? this.portfolio,
        contractType: contractType ?? this.contractType,
      );
  // Creating Enum Mappers

  static final Map<ContractTypeEnum, String> contractTypeEnumMapper = {
    ContractTypeEnum.ASIAND: 'ASIAND',
    ContractTypeEnum.ASIANU: 'ASIANU',
    ContractTypeEnum.CALL: 'CALL',
    ContractTypeEnum.CALLE: 'CALLE',
    ContractTypeEnum.CALLSPREAD: 'CALLSPREAD',
    ContractTypeEnum.DIGITDIFF: 'DIGITDIFF',
    ContractTypeEnum.DIGITEVEN: 'DIGITEVEN',
    ContractTypeEnum.DIGITMATCH: 'DIGITMATCH',
    ContractTypeEnum.DIGITODD: 'DIGITODD',
    ContractTypeEnum.DIGITOVER: 'DIGITOVER',
    ContractTypeEnum.DIGITUNDER: 'DIGITUNDER',
    ContractTypeEnum.EXPIRYMISSE: 'EXPIRYMISSE',
    ContractTypeEnum.EXPIRYMISS: 'EXPIRYMISS',
    ContractTypeEnum.EXPIRYRANGE: 'EXPIRYRANGE',
    ContractTypeEnum.EXPIRYRANGEE: 'EXPIRYRANGEE',
    ContractTypeEnum.LBFLOATCALL: 'LBFLOATCALL',
    ContractTypeEnum.LBFLOATPUT: 'LBFLOATPUT',
    ContractTypeEnum.LBHIGHLOW: 'LBHIGHLOW',
    ContractTypeEnum.MULTDOWN: 'MULTDOWN',
    ContractTypeEnum.MULTUP: 'MULTUP',
    ContractTypeEnum.NOTOUCH: 'NOTOUCH',
    ContractTypeEnum.ONETOUCH: 'ONETOUCH',
    ContractTypeEnum.PUT: 'PUT',
    ContractTypeEnum.PUTE: 'PUTE',
    ContractTypeEnum.PUTSPREAD: 'PUTSPREAD',
    ContractTypeEnum.RANGE: 'RANGE',
    ContractTypeEnum.RESETCALL: 'RESETCALL',
    ContractTypeEnum.RESETPUT: 'RESETPUT',
    ContractTypeEnum.RUNHIGH: 'RUNHIGH',
    ContractTypeEnum.RUNLOW: 'RUNLOW',
    ContractTypeEnum.TICKHIGH: 'TICKHIGH',
    ContractTypeEnum.TICKLOW: 'TICKLOW',
    ContractTypeEnum.UPORDOWN: 'UPORDOWN',
  };
}

// Creating Enums

enum ContractTypeEnum {
  ASIAND,
  ASIANU,
  CALL,
  CALLE,
  CALLSPREAD,
  DIGITDIFF,
  DIGITEVEN,
  DIGITMATCH,
  DIGITODD,
  DIGITOVER,
  DIGITUNDER,
  EXPIRYMISSE,
  EXPIRYMISS,
  EXPIRYRANGE,
  EXPIRYRANGEE,
  LBFLOATCALL,
  LBFLOATPUT,
  LBHIGHLOW,
  MULTDOWN,
  MULTUP,
  NOTOUCH,
  ONETOUCH,
  PUT,
  PUTE,
  PUTSPREAD,
  RANGE,
  RESETCALL,
  RESETPUT,
  RUNHIGH,
  RUNLOW,
  TICKHIGH,
  TICKLOW,
  UPORDOWN,
}
