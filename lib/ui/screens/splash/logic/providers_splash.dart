import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/ui/screens/home/home_screen.dart';
import 'package:res_app/ui/screens/login/login_screen.dart';

final initialLoadProvider = FutureProvider<Route?>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return ref.watch(userFirebaseProvider).when(
        data: (user) {
          if (user != null) {
            return HomeScreen.goTo();
          } else {
            return LoginScreen.goTo();
          }
        },
        error: (e, err) {
          return LoginScreen.goTo();
        },
        loading: () {
          return null;
        },
      );

});
