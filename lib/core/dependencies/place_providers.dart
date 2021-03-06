import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/data_sources/place_data_source.dart';
import 'package:res_app/core/dependencies/apis_providers.dart';
import 'package:res_app/core/repositories/place/place_repository.dart';
import 'package:res_app/core/use_cases/get_place_auto_complete_use_case.dart';
import 'package:res_app/core/use_cases/get_restaurants_city_use_case.dart';

final placeDataSourceProvider = Provider(
  (ref) => PlaceDataSource(
    apiUtils: ref.watch(
      placeApiProvider,
    ),
  ),
);

final placeRepositoryProvider = Provider(
  (ref) => PlaceRepository(
    placeDataSource: ref.watch(
      placeDataSourceProvider,
    ),
  ),
);

final getPlaceAutoCompleteUseCaseProvider = Provider(
      (ref) => GetPlaceAutoCompleteUseCase(
    placeRepository: ref.watch(
      placeRepositoryProvider,
    ),
  ),
);

final getRestaurantsByCityUseCaseProvider = Provider(
      (ref) => GetRestaurantsByCityUseCase(
    placeRepository: ref.watch(
      placeRepositoryProvider,
    ),
  ),
);
