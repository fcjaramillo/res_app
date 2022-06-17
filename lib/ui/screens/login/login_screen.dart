import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/screens/home/home_screen.dart';
import 'package:res_app/ui/screens/login/logic/provider_login.dart';
import 'package:res_app/ui/screens/new_user/new_user_screen.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/utils/responsive.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: kRouteLogin),
      );

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    final isVisiblePass = ref.watch(isVisiblePasswordLoginProvider);
    return Scaffold(
      backgroundColor: kBlueDark,
      body: SingleChildScrollView(
        child: SizedBox(
          height: responsive.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens24),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        kAnimationBowl,
                        width: responsive.wp(kDimens70),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: I18n.of(context).sLoginEmail,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kWhite100,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(kDimens20),
                            borderSide: const BorderSide(
                              color: kGreenBlue,
                              width: kDimens2,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: kWhite80,
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(kDimens20),
                            borderSide: const BorderSide(
                              color: kWhite100,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: kWhite80,
                        ),
                        controller: emailCtrl,
                      ),
                      const SizedBox(
                        height: kDimens20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: I18n.of(context).sLoginPass,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: kWhite100)),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(kDimens20),
                            borderSide: const BorderSide(
                              color: kGreenBlue,
                              width: kDimens2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(kDimens20),
                            borderSide: const BorderSide(color: kWhite100),
                          ),
                          labelStyle: const TextStyle(
                            color: kWhite80,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisiblePass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGreenBlue,
                            ),
                            onPressed: () {
                              ref
                                  .read(isVisiblePasswordLoginProvider.notifier)
                                  .update((state) => !state);
                            },
                          ),
                        ),
                        style: const TextStyle(
                          color: kWhite80,
                        ),
                        controller: passwordCtrl,
                        keyboardType: TextInputType.text,
                        obscureText: !isVisiblePass,
                      ),
                      const SizedBox(
                        height: kDimens24,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kGreenBlue),
                        onPressed: () async {
                          final res =
                              await ref.watch(authServicesProvider).singIn(
                                    email: emailCtrl.text.trim(),
                                    password: passwordCtrl.text.trim(),
                                  );
                          if (res == kSignedIn) {
                            Navigator.pushReplacement(
                              context,
                              HomeScreen.goTo(),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(res),
                                backgroundColor: kDarkRed,
                              ),
                            );
                          }
                        },
                        child: Text(
                          I18n.of(context).sLoginSingIn,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ResText(
                        colorText: kWhite100,
                        text: I18n.of(context).sLoginNoAccount,
                        fontSize: kDimens14,
                        fontWeight: FontWeight.w300,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, NewUserScreen.goTo());
                        },
                        child: Text(
                          I18n.of(context).sLoginSingUp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kDimens20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
