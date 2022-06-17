import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/entities/city.dart';
import 'package:res_app/core/entities/result_state.dart';
import 'package:res_app/core/models/result.dart';
import 'package:res_app/core/use_cases/get_place_auto_complete_use_case.dart';

class GetPlaceAutoCompleteNotifier
    extends StateNotifier<ResultState<List<City>, BackError>> {
  GetPlaceAutoCompleteNotifier({
    required GetPlaceAutoCompleteUseCase getPlaceAutoCompleteUseCase,
  })  : _getPlaceAutoCompleteUseCase = getPlaceAutoCompleteUseCase,
        super(ResultState.initial());
  final GetPlaceAutoCompleteUseCase _getPlaceAutoCompleteUseCase;

  Future<void> validateCode({
    required String city,
  }) async {
    state = ResultState.loading();
    final response = await _getPlaceAutoCompleteUseCase.call(
      city: city,
    );

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
