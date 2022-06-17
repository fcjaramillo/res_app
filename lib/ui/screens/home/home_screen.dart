import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/core/dependencies/services_providers.dart';
import 'package:res_app/core/device/location.dart';
import 'package:res_app/core/entities/city.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/screens/home/logic/providers_home.dart';
import 'package:res_app/ui/screens/home/widgets/city_widget.dart';
import 'package:res_app/ui/screens/login/login_screen.dart';
import 'package:res_app/ui/screens/restaurants/restaurants_screen.dart';
import 'package:res_app/ui/utils/constants/constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: kRouteHome),
      );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final searchCtrl = TextEditingController();

  @override
  void initState(){
    LocationDevice().initLocationService();
    super.initState();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(searchCityProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kBlueDark,
            pinned: true,
            forceElevated: true,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(kDimens15),
              child: Text(''),
            ),
            flexibleSpace: Container(
              padding: const EdgeInsets.only(
                top: kDimens50,
                left: kDimens20,
                right: kDimens20,
                bottom: kDimens15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kDimens50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 2.0),
                      blurRadius: kDimens8,
                      spreadRadius: 0.5,
                    )
                  ],
                ),
                height: kDimens70,
                child: TextField(
                  controller: searchCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kDimens50),
                    ),
                    hintText: I18n.of(context).sHomeAskCity,
                    prefixIcon: GestureDetector(
                      onTap: () {
                        ref
                            .read(searchCityProvider.notifier)
                            .update((state) => [
                                  ...state,
                                  City(
                                    description: '',
                                    placeId: 5,
                                    name: searchCtrl.text.trim(),
                                    state: '',
                                  ),
                                ]);
                        Navigator.push(
                          context,
                          RestaurantScreen.goTo(
                            city: searchCtrl.text.trim(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        color: kBlack100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDimens20,
                vertical: kDimens10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () async {
                      final location = await LocationDevice().getLocationString();
                      Navigator.push(
                        context,
                        RestaurantScreen.goTo(
                          city: location,
                        ),
                      );
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(kDimens5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45)),
                      child: const Icon(
                        Icons.near_me_outlined,
                        size: kDimens25,
                      ),
                    ),
                    title: Text(
                      I18n.of(context).sHomeNearRestaurant,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: kDimens10,
                  ),
                  Text(
                    I18n.of(context).sHomePopularDestines,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDimens20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            RestaurantScreen.goTo(
                              city:
                                  "${cities[index].name} ${cities[index].state}",
                            ),
                          );
                        },
                        child: CityWidget(
                          namePlace: cities[index].name,
                          countryPlace: cities[index].state,
                        ),
                      ),
                      Visibility(
                        visible: index != cities.length - 1,
                        child: const Divider(),
                      ),
                    ],
                  ),
                );
              },
              childCount: cities.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlueDark,
        onPressed: () async {
          await ref.watch(authServicesProvider).singOut();
          Navigator.pushReplacement(context, LoginScreen.goTo());
        },
        child: const Icon(
          Icons.login,
        ),
      ),
    );
  }
}
