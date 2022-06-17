import 'package:res_app/core/entities/restaurant.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/core/repositories/place/iplace_repository.dart';

class GetRestaurantsByCityUseCase{
  GetRestaurantsByCityUseCase({
    required IPlaceRepository placeRepository,
  }) : _placeRepository = placeRepository;

  final IPlaceRepository _placeRepository;

  Future<Result<List<Restaurant>, BackError>> call({
    required String city,
  }) =>
      _placeRepository.getRestaurantsByCity(
        city: city,
      );
}