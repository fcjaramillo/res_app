import 'package:res_app/core/entities/city.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/core/repositories/place/iplace_repository.dart';

class GetPlaceAutoCompleteUseCase{
  GetPlaceAutoCompleteUseCase({
    required IPlaceRepository placeRepository,
  }) : _placeRepository = placeRepository;

  final IPlaceRepository _placeRepository;

  Future<Result<List<City>, BackError>> call({
    required String city,
  }) =>
      _placeRepository.getPlaceAutoComplete(
        city: city,
      );
}