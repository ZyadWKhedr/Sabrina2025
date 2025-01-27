class Favourite {
  final int id;
  final int userId;
  final int productId;

  Favourite({
    required this.id,
    required this.userId,
    required this.productId,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
    );
  }
}