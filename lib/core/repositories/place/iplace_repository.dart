import 'package:res_app/core/entities/city.dart';
import 'package:res_app/core/entities/restaurant.dart';
import 'package:res_app/core/models/result.dart';

abstract class IPlaceRepository{

  Future<Result<List<City>, BackError>> getPlaceAutoComplete({
    required String city,
  });

  Future<Result<List<Restaurant>, BackError>> getRestaurantsByCity({
    required String city,
  });

}