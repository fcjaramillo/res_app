import 'package:res_app/core/api/api_utils.dart';
import 'package:res_app/core/models/city_model.dart';
import 'package:res_app/core/models/restaurant_model.dart';
import 'package:res_app/core/models/result.dart';

class PlaceDataSource {
  final ApiUtils _apiUtils;

  PlaceDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  Future<Result<List<CityModel>, BackError>> getPlaceAutoComplete({
    required String city,
  }) async {
    const String path = "api/place/autocomplete/json";

    final parameters = {
      'input': city,
      'types': '(cities)',
      'key': 'AIzaSyCtA5CIRGctWzuSbTA9Tl68x5NQJZuuJ1o',
    };

    Result<dynamic, BackError> result = await _apiUtils.makeRequest(
      method: Method.get,
      path: path,
      queryParameters: parameters,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(
        (success['predictions'] as List)
            .map((e) => CityModel.fromJson(e))
            .toList(),
      ),
    );
  }

  Future<Result<List<RestaurantModel>, BackError>> getRestaurantsByCity({
    required String city,
  }) async {
    const String path = "maps/api/place/textsearch/json";

    final parameters = {
      'query': 'restaurants in $city',
      'key': 'AIzaSyCtA5CIRGctWzuSbTA9Tl68x5NQJZuuJ1o',
    };

    Result<dynamic, BackError> result = await _apiUtils.makeRequest(
      method: Method.get,
      path: path,
      queryParameters: parameters,
    );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(
        (success['results'] as List)
            .map((e) => RestaurantModel.fromJson(e))
            .toList(),
      ),
    );
  }

}
