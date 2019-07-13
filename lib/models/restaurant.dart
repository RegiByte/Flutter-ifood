import 'dart:convert';

class Restaurant {
  final String name;
  final String picture;
  final String rating;
  final String foodType;
  final String distance;
  final String deliveryTime;
  final String deliveryPrice;

  Restaurant({
    this.name,
    this.picture,
    this.rating,
    this.foodType,
    this.distance,
    this.deliveryPrice,
    this.deliveryTime,
  });

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
      name: jsonData['name'],
      picture: jsonData['picture'],
      rating: jsonData['rating'],
      foodType: jsonData['foodType'],
      distance: jsonData['distance'],
      deliveryTime: jsonData['deliveryTime'],
      deliveryPrice: jsonData['deliveryPrice'],
    );
  }

  toJson() {
    return jsonEncode({
      'name': name,
      'picture': picture,
      'rating': rating,
      'foodType': foodType,
      'distance': distance,
      'deliveryTime': deliveryTime,
      'deliveryPrice': deliveryPrice
    });
  }
}
