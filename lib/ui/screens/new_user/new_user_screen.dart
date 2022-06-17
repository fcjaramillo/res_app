import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/screens/new_user/logic/provider_new_user.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/utils/responsive.dart';

class NewUserScreen extends ConsumerStatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
    builder: (_) => const NewUserScreen(),
    settings: const RouteSettings(name: kRouteNewUser),
  );

  @override
  ConsumerState<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends ConsumerState<NewUserScreen> {

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose(){
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final isVisiblePass = ref.watch(isVisiblePasswordNewUserProvider);
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
                        kAnimationNewUser,
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
                                  .read(isVisiblePasswordNewUserProvider.notifier)
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
                        child: Text(
                          I18n.of(context).sNewUserCreate,
                        ),
                        style: ElevatedButton.styleFrom(primary: kGreenBlue),
                        onPressed: () async {
                          final res = await ref.watch(authServicesProvider).singUp(
                            email: emailCtrl.text.trim(),
                            password: passwordCtrl.text.trim(),
                          );
                          if(res == kSignedUp){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Usuario registrado exitosamente"),
                                backgroundColor: kGreen,
                              ),
                            );
                            Future.delayed(Duration(seconds: 1), (){
                              Navigator.pop(context);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(res),
                                backgroundColor: kDarkRed,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
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
