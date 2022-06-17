import 'package:flutter/material.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/utils/responsive.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class RestaurantDetail extends StatelessWidget {
  final String _address;
  final int _index;
  final String _name;
  final double _rating;
  final int _userRating;
  final String _photo;

  RestaurantDetail({
    Key? key,
    required String city,
    required int index,
    required String name,
    required double rating,
    required int userRating,
    required String photo,
  })  : _address = city,
        _index = index,
        _name = name,
        _rating = rating,
        _userRating = userRating,
        _photo = photo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final restaurantPhoto = Container(
      height: kDimens90,
      width: kDimens90,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_photo), fit: BoxFit.cover)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDimens10,
        horizontal: kDimens20,
      ),
      child: Row(
        children: [
          restaurantPhoto,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDimens20),
            child: SizedBox(
              width: responsive.wp(kDimens60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResText(
                    colorText: kBlack100,
                    text: '$_index. $_name',
                    fontSize: kDimens12,
                    fontWeight: FontWeight.bold,
                  ),
                  ResText(
                    colorText: kBlack100,
                    text: _address,
                    fontSize: kDimens12,
                    maxLines: 2,
                    fontWeight: FontWeight.w400,
                  ),
                  ResText(
                    colorText: kBlack100,
                    text: 'rating: $_rating',
                    fontSize: kDimens12,
                    fontWeight: FontWeight.w400,
                  ),
                  ResText(
                    colorText: kBlack100,
                    text: 'val: $_userRating',
                    fontSize: kDimens12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
