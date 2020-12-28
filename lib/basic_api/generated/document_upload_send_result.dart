/// Document upload send model class
abstract class DocumentUploadSendModel {
  /// Initializes
  DocumentUploadSendModel({
    @required this.documentUpload,
    @required this.documentFormat,
    this.documentId,
    @required this.documentType,
    @required this.expectedChecksum,
    this.expirationDate,
    @required this.fileSize,
    this.pageType,
  });

  /// Must be `1`
  final int documentUpload;

  /// Document file format
  final DocumentFormatEnum documentFormat;

  /// [Optional] Document ID (required for Passport, Proof of ID and Driver's License)
  final String documentId;

  /// Document type
  final DocumentTypeEnum documentType;

  /// The checksum of the file to be uploaded
  final String expectedChecksum;

  /// [Optional] Document expiration date (required for Passport, Proof of ID and Driver's License)
  final String expirationDate;

  /// Document size (should be less than 3MB)
  final int fileSize;

  /// [Optional] To determine document side
  final PageTypeEnum pageType;
}

/// Document upload send class
class DocumentUploadSend extends DocumentUploadSendModel {
  /// Initializes
  DocumentUploadSend({
    @required int documentUpload,
    @required String documentFormat,
    String documentId,
    @required String documentType,
    @required String expectedChecksum,
    String expirationDate,
    @required int fileSize,
    String pageType,
  }) : super(
          documentUpload: documentUpload,
          documentFormat: documentFormat,
          documentId: documentId,
          documentType: documentType,
          expectedChecksum: expectedChecksum,
          expirationDate: expirationDate,
          fileSize: fileSize,
          pageType: pageType,
        );

  /// Creates an instance from JSON
  factory DocumentUploadSend.fromJson(Map<String, dynamic> json) =>
      DocumentUploadSend(
        documentUpload: json['document_upload'],
        documentFormat: json['document_format'] == null
            ? null
            : documentFormatEnumMapper.entries
                .firstWhere((entry) => entry.value == json['document_format'],
                    orElse: () => null)
                ?.key,
        documentId: json['document_id'],
        documentType: json['document_type'] == null
            ? null
            : documentTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['document_type'],
                    orElse: () => null)
                ?.key,
        expectedChecksum: json['expected_checksum'],
        expirationDate: json['expiration_date'],
        fileSize: json['file_size'],
        pageType: json['page_type'] == null
            ? null
            : pageTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['page_type'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['document_upload'] = documentUpload;
    result['document_format'] = documentFormatEnumMapper[documentFormat];
    result['document_id'] = documentId;
    result['document_type'] = documentTypeEnumMapper[documentType];
    result['expected_checksum'] = expectedChecksum;
    result['expiration_date'] = expirationDate;
    result['file_size'] = fileSize;
    result['page_type'] = pageTypeEnumMapper[pageType];

    return result;
  }

  /// Creates a copy of instance with given parameters
  DocumentUploadSend copyWith({
    int documentUpload,
    String documentFormat,
    String documentId,
    String documentType,
    String expectedChecksum,
    String expirationDate,
    int fileSize,
    String pageType,
  }) =>
      DocumentUploadSend(
        documentUpload: documentUpload ?? this.documentUpload,
        documentFormat: documentFormat ?? this.documentFormat,
        documentId: documentId ?? this.documentId,
        documentType: documentType ?? this.documentType,
        expectedChecksum: expectedChecksum ?? this.expectedChecksum,
        expirationDate: expirationDate ?? this.expirationDate,
        fileSize: fileSize ?? this.fileSize,
        pageType: pageType ?? this.pageType,
      );
  // Creating Enum Mappers

  static final Map<DocumentFormatEnum, String> documentFormatEnumMapper = {
    DocumentFormatEnum.PNG: 'PNG',
    DocumentFormatEnum.JPG: 'JPG',
    DocumentFormatEnum.JPEG: 'JPEG',
    DocumentFormatEnum.GIF: 'GIF',
    DocumentFormatEnum.PDF: 'PDF',
  };

  static final Map<DocumentTypeEnum, String> documentTypeEnumMapper = {
    DocumentTypeEnum.passport: 'passport',
    DocumentTypeEnum.national_identity_card: 'national_identity_card',
    DocumentTypeEnum.driving_licence: 'driving_licence',
    DocumentTypeEnum.utility_bill: 'utility_bill',
    DocumentTypeEnum.bankstatement: 'bankstatement',
    DocumentTypeEnum.power_of_attorney: 'power_of_attorney',
    DocumentTypeEnum.amlglobalcheck: 'amlglobalcheck',
    DocumentTypeEnum.docverification: 'docverification',
    DocumentTypeEnum.proofid: 'proofid',
    DocumentTypeEnum.driverslicense: 'driverslicense',
    DocumentTypeEnum.proofaddress: 'proofaddress',
    DocumentTypeEnum.other: 'other',
  };

  static final Map<PageTypeEnum, String> pageTypeEnumMapper = {
    PageTypeEnum.front: 'front',
    PageTypeEnum.back: 'back',
    PageTypeEnum.photo: 'photo',
  };
}

// Creating Enums

enum DocumentFormatEnum {
  PNG,
  JPG,
  JPEG,
  GIF,
  PDF,
}

enum DocumentTypeEnum {
  passport,
  national_identity_card,
  driving_licence,
  utility_bill,
  bankstatement,
  power_of_attorney,
  amlglobalcheck,
  docverification,
  proofid,
  driverslicense,
  proofaddress,
  other,
}

enum PageTypeEnum {
  front,
  back,
  photo,
}
