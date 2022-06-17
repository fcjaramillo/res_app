import 'package:equatable/equatable.dart';
import 'package:res_app/core/entities/city.dart';

class CityModel extends Equatable {
  final String description;
  final int placeId;
  final String mainText;
  final String secondaryText;

  const CityModel({
    required this.description,
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
  });

  City toEntity() {
    return City(
      description: description,
      placeId: placeId,
      name: mainText,
      state: secondaryText,
    );
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      description: json['description'] ?? '',
      placeId: json['placeId'] ?? '',
      mainText: json['structured_formatting']?['mainText'] ?? '',
      secondaryText: json['structured_formatting']?['secondaryText'] ?? '',
    );
  }

  @override
  List<Object?> get props => [description, placeId, mainText, secondaryText];
}
