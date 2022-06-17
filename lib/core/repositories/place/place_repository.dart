import 'package:res_app/core/data_sources/place_data_source.dart';
import 'package:res_app/core/entities/city.dart';
import 'package:res_app/core/entities/restaurant.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/core/repositories/place/iplace_repository.dart';

class PlaceRepository extends IPlaceRepository {
  final PlaceDataSource _placeDataSource;

  PlaceRepository({
    required PlaceDataSource placeDataSource,
  }) : _placeDataSource = placeDataSource;

  @override
  Future<Result<List<City>, BackError>> getPlaceAutoComplete({
    required String city,
  }) async {
    final result = await _placeDataSource.getPlaceAutoComplete(
      city: city,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Result<List<Restaurant>, BackError>> getRestaurantsByCity({
    required String city,
  }) async {
    final result = await _placeDataSource.getRestaurantsByCity(
      city: city,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(success.map((e) => e.toEntity()).toList()),
    );
  }
}
