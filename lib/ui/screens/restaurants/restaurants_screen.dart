import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:res_app/generated/l10n.dart';
import 'package:res_app/ui/screens/restaurants/logic/providers_restaurants.dart';
import 'package:res_app/ui/screens/restaurants/widgets/restaurant_detail_widget.dart';
import 'package:res_app/ui/utils/constants/colors.dart';
import 'package:res_app/ui/utils/constants/dimensions.dart';
import 'package:res_app/ui/utils/constants/routes.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  RestaurantScreen({
    required String city,
    Key? key,
  })  : _city = city,
        super(key: key);

  final String _city;

  static Route goTo({
    required String city,
  }) =>
      MaterialPageRoute(
          builder: (_) => RestaurantScreen(
                city: city,
              ),
          settings: RouteSettings(name: kRouteRestaurants));

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref
          .read(getRestaurantsByCityNotifierProvider.notifier)
          .getRestaurantsByCity(city: widget._city);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getRestaurantsByCityNotifierProvider);
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            elevation: kDimens0,
            title: ResText(
              text: I18n.of(context).sRestaurants,
              fontWeight: FontWeight.bold,
              colorText: kWhite100,
              fontSize: kDimens16,
            ),
            backgroundColor: kBlueDark,
            foregroundColor: kWhite100,
          ),
          body: state.isLoading
              ? Center(child: CircularProgressIndicator())
              : state.data != null
                  ? ListView.separated(
                      itemCount: state.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RestaurantDetail(
                          city: state.data![index].address,
                          index: index + 1,
                          name: state.data![index].name,
                          rating: state.data![index].rating,
                          userRating: state.data![index].userRatingsTotal,
                          photo:
                          "https://t3.ftcdn.net/jpg/03/20/66/58/360_F_320665868_8lmuqlXbHFg0TUnZvnq8jSxFGKD643i2.jpg",
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Visibility(
                          child: const Divider(),
                          visible: index != state.data!.length - 1,
                        );
                      },
                    )
                  : state.error != null
                      ? Text(state.error?.err ?? '')
                      : SizedBox.shrink()),
    );
  }
}
