import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/utils/responsive.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueDark,
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
