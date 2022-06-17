import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/entities/city.dart';

final searchCityProvider = StateProvider<List<City>>((ref) => [
  City(description: "", placeId: 0, name: "Bogota", state: "Colombia"),
  City(description: "", placeId: 1, name: "Medellin", state: "Colombia"),
  City(description: "", placeId: 2, name: "Cali", state: "Colombia"),
  City(description: "", placeId: 2, name: "Florida", state: "EEUU")
]);