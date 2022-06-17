import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/services/auth_services.dart';

final authServicesProvider = Provider(
  (ref) => AuthService(
    firebaseAuth: FirebaseAuth.instance,
  ),
);

final userFirebaseProvider = StreamProvider(
  (ref) => ref.watch(authServicesProvider).authStateChanges,
);