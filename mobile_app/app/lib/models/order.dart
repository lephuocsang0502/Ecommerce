class Order {
  final String address, paymentStatus, product, paymentType;
  final int amount, purchasedQty;
  final double payablePrice;
  //final Map<String, dynamic> product;

  Order(
      {this.product,
      this.paymentType,
      this.address,
      this.amount,
      this.payablePrice,
      this.paymentStatus,
      this.purchasedQty});

  Map<String, dynamic> toJson() => {
        'paymentType': paymentType,
        'addressId': address,
        'totalAmount': amount,
        'items': [
          {
            'productId': product,
            'purchasedQty': purchasedQty,
            'payablePrice': payablePrice
          }
        ],
        'paymentStatus': paymentStatus
      };

  // factory Order.fromJson(Map<String, dynamic> json) {
  //   return Order(
  //     message: json['message'],
  //     code: json['code'],
  //   );
}

class OrderResponse {
  final String message;
  final int code;

  OrderResponse({
    this.message,
    this.code,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      message: json['message'],
      code: json['code'],
    );
  }
}
