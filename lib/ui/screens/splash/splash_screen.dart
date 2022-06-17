import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/screens/home/home_screen.dart';
import 'package:res_app/ui/screens/login/login_screen.dart';
import 'package:res_app/ui/screens/splash/logic/providers_splash.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/utils/responsive.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<Route?>>(initialLoadProvider, (val, value) {
      value.when(
        data: (data) {
          if(data != null){
            Navigator.of(context).pushReplacement(data);
          }
        },
        error: (err, obj) {},
        loading: () {},
      );
    });

    /*ref.watch(userFirebaseProvider).when(
      data: (user) {
        print(user);
        if (user != null) {
          Navigator.of(context).pushReplacement(HomeScreen.goTo());
        } else {
          Navigator.of(context).pushReplacement(LoginScreen.goTo());
        }
      },
      error: (e, err) {},
      loading: () {},
    );*/

    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueDark,
        elevation: kDimens0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kBlueDark,
        ),
        height: responsive.height,
        padding: const EdgeInsets.symmetric(horizontal: kDimens12),
        width: responsive.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(kAnimationRestaurant),
            const SizedBox(height: kDimens24),
            ResText(
              colorText: kWhite100,
              text: I18n.of(context).sSplashLoading,
              fontSize: kDimens24,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: kDimens24),
            Lottie.asset(kAnimationLoadingDot),
          ],
        ),
      ),
    );
  }
}
