import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/entities/restaurant.dart';
import 'package:res_app/core/entities/result_state.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/core/use_cases/get_restaurants_city_use_case.dart';

class GetRestaurantsByCityNotifier
    extends StateNotifier<ResultState<List<Restaurant>, BackError>> {
  GetRestaurantsByCityNotifier({
    required GetRestaurantsByCityUseCase getRestaurantsByCityUseCase,
  })  : _getRestaurantsByCityUseCase = getRestaurantsByCityUseCase,
        super(ResultState.initial());
  final GetRestaurantsByCityUseCase _getRestaurantsByCityUseCase;

  Future<void> getRestaurantsByCity({
    required String city,
  }) async {
    state = ResultState.loading();
    final response = await _getRestaurantsByCityUseCase.call(
      city: city,
    );

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
