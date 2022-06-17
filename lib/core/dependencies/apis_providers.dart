import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/api/api_utils.dart';

final clientProvider = Provider((ref) => Dio());

final placeApiProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider),
    host: 'maps.googleapis.com',
  ),
);
