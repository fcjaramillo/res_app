import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/dependencies/place_providers.dart';
import 'package:res_app/core/entities/restaurant.dart';
import 'package:res_app/core/entities/result_state.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/ui/screens/restaurants/logic/get_restaurants_by_city_notifier.dart';

final getRestaurantsByCityNotifierProvider = StateNotifierProvider<
    GetRestaurantsByCityNotifier, ResultState<List<Restaurant>, BackError>>(
  (ref) => GetRestaurantsByCityNotifier(
    getRestaurantsByCityUseCase: ref.watch(
      getRestaurantsByCityUseCaseProvider,
    ),
  ),
);
