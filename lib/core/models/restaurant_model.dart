import 'package:equatable/equatable.dart';
import 'package:res_app/core/entities/restaurant.dart';

class RestaurantModel extends Equatable {
  final String name;
  final String formattedAddress;
  final double rating;
  final int userRatingsTotal;

  const RestaurantModel({
    required this.name,
    required this.formattedAddress,
    required this.rating,
    required this.userRatingsTotal,
  });

  Restaurant toEntity() {
    return Restaurant(
      name: name,
      address: formattedAddress,
      rating: rating,
      userRatingsTotal: userRatingsTotal,
    );
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'] ?? '',
      formattedAddress: json['formatted_address'] ?? '',
      rating: ((json['rating'] ?? 0) as num).toDouble(),
      userRatingsTotal: ((json['user_ratings_total'] ?? 0) as num).toInt(),
    );
  }

  @override
  List<Object?> get props => [name, formattedAddress, rating, userRatingsTotal];
}
