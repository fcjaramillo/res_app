import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/data_sources/place_data_source.dart';
import 'package:res_app/core/dependencies/apis_providers.dart';
import 'package:res_app/core/repositories/place/place_repository.dart';

final placeDataSourceProvider = Provider((ref) => PlaceDataSource(
      apiUtils: ref.watch(placeApiProvider,),
    ),);

final placeRepositoryProvider = Provider((ref) => PlaceRepository(
      placeDataSource: ref.watch(placeDataSourceProvider,),
    ),);
