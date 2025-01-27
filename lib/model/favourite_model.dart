class Favourite {
  final String productId;
  final String userId;

  Favourite({
    required this.productId,
    required this.userId,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      productId: json['product_id'],
      userId: json['user_id'],
    );
  }
}
