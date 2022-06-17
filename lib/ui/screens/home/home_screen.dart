import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/ui/screens/login/login_screen.dart';
import 'package:res_app/ui/utils/constants/constants.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
    builder: (_) => const HomeScreen(),
    settings: const RouteSettings(name: kRouteHome),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        backgroundColor: kBlueDark,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.login,
        ),
        backgroundColor: kBlueDark,
        onPressed: () async {
          await ref.watch(authServicesProvider).singOut();
          Navigator.pushReplacement(context, LoginScreen.goTo());
        },
      ),
    );
  }
}
