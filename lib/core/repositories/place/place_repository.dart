import 'package:res_app/core/data_sources/place_data_source.dart';
import 'package:res_app/core/repositories/place/iplace_repository.dart';

class PlaceRepository extends IClassRepository {
  final PlaceDataSource _placeDataSource;

  PlaceRepository({
    required PlaceDataSource placeDataSource,
  }) : _placeDataSource = placeDataSource;

}
