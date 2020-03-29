import '../../enums/generals.dart';
import '../advertiser/advertiser.dart';

class Advert {
  final String accountCurrency;
  final Advertiser advertiserDetails;
  final double amount;
  final String amountDisplay;
  final double remainingAmount;
  final String remainingAmountDisplay;
  final String country;
  final AdvertType counterpartyType;
  final int createdTime;
  final String description;
  final String id;
  final bool isActive;
  final String localCurrency;
  final double maxOrderAmount;
  final String maxOrderAmountDisplay;
  final double maxOrderAmountLimit;
  final String maxOrderAmountLimitDisplay;
  final double minOrderAmount;
  final String minOrderAmountDisplay;
  final double minOrderAmountLimit;
  final String minOrderAmountLimitDisplay;
  final PaymentMethod paymentMethod;
  final double price;
  final String priceDisplay;
  final double rate;
  final String rateDisplay;
  final AdvertType type;
  final String paymentDetails;
  final String contactDetails;

  /// It will be false if the remaining amount of the advert is less than the minAmount.
  bool get isPurchasable => remainingAmount >= minOrderAmountLimit;

  Advert({
    this.counterpartyType,
    this.accountCurrency,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.country,
    this.createdTime,
    this.isActive,
    this.localCurrency,
    this.maxOrderAmountLimit,
    this.maxOrderAmountLimitDisplay,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.paymentMethod,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.description,
    this.id,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.type,
    this.paymentDetails,
    this.contactDetails,
  });

  Advert.fromMap(Map<String, dynamic> advert)
      : accountCurrency = advert['account_currency'],
        advertiserDetails = Advertiser.fromMap(
            advert['advertiser_details'] ?? <String, dynamic>{}),
        amount = advert['amount']?.toDouble(),
        amountDisplay = advert['amount_display'],
        country = advert['country'],
        counterpartyType =
            advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        createdTime = advert['created_time'],
        description = advert['description'],
        id = advert['id'],
        isActive = advert['is_active'] == 1 ? true : false,
        localCurrency = advert['local_currency'],
        maxOrderAmount = advert['max_order_amount']?.toDouble(),
        maxOrderAmountDisplay = advert['max_order_amount_display'],
        maxOrderAmountLimit = advert['max_order_amount_limit']?.toDouble(),
        maxOrderAmountLimitDisplay = advert['max_order_amount_limit_display'],
        paymentMethod = _getPaymentMethod(advert['payment_method']),
        minOrderAmount = advert['min_order_amount']?.toDouble(),
        minOrderAmountDisplay = advert['min_order_amount_display'],
        minOrderAmountLimit = advert['min_order_amount_limit']?.toDouble(),
        minOrderAmountLimitDisplay = advert['min_order_amount_limit_display'],
        price = advert['price']?.toDouble(),
        priceDisplay = advert['price_display'],
        rate = advert['rate']?.toDouble(),
        rateDisplay = advert['rate_display'],
        remainingAmount = advert['remaining_amount']?.toDouble(),
        remainingAmountDisplay = advert['remaining_amount_display'],
        type = advert['type'] == 'sell' ? AdvertType.sell : AdvertType.buy,
        paymentDetails = advert['payment_info'],
        contactDetails = advert['contact_info'];

  Advert copyWith({
    String accountCurrency,
    Advertiser advertiserDetails,
    double amount,
    double amountUsed,
    String country,
    AdvertType counterpartyType,
    int createdTime,
    bool isActive,
    String localCurrency,
    double maxAmount,
    double maxAmountLimit,
    PaymentMethod paymentMethod,
    double minAmount,
    double minAmountLimit,
    String orderDescription,
    double price,
    double rate,
    bool isDeleted,
    String paymentDetails,
    String contactDetails,
  }) {
    return Advert(
      counterpartyType: counterpartyType ?? this.counterpartyType,
      accountCurrency: accountCurrency ?? this.accountCurrency,
      advertiserDetails: advertiserDetails ?? this.advertiserDetails,
      amount: amount ?? this.amount,
      remainingAmount: amountUsed ?? this.remainingAmount,
      country: country ?? this.country,
      createdTime: createdTime ?? this.createdTime,
      isActive: isActive ?? this.isActive,
      localCurrency: localCurrency ?? this.localCurrency,
      maxOrderAmount: maxAmount ?? this.maxOrderAmount,
      maxOrderAmountLimit: maxAmountLimit ?? this.maxOrderAmountLimit,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      minOrderAmount: minAmount ?? this.minOrderAmount,
      minOrderAmountLimit: minAmountLimit ?? this.minOrderAmountLimit,
      description: orderDescription ?? this.description,
      id: this.id,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      contactDetails: contactDetails ?? this.contactDetails,
    );
  }

  static PaymentMethod _getPaymentMethod(String paymentMethod) {
    return paymentMethod == 'bank_transfer' ? PaymentMethod.bankTransfer : null;
  }

  String get paymentMethodDisplay {
    switch (paymentMethod) {
      case (PaymentMethod.bankTransfer):
        return 'Bank transfer';
      default:
        throw Exception('No display value for $paymentMethod payment method.');
    }
  }

  String get paymentInfoLabel {
    switch (paymentMethod) {
      case (PaymentMethod.bankTransfer):
        return 'Bank details';
      default:
        throw Exception(
            'No payment info label for $paymentMethod payment method.');
    }
  }

  @override
  String toString() => 'Advert { id: $id name: ${advertiserDetails.name} }';
}
