import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String name;
  final String address;
  final double rating;
  final int userRatingsTotal;

  const Restaurant({
    required this.name,
    required this.address,
    required this.rating,
    required this.userRatingsTotal,
  });

  @override
  List<Object?> get props => [name, address, rating, userRatingsTotal];
}
