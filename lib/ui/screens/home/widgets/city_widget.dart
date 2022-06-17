import 'package:flutter/material.dart';
import 'package:res_app/ui/utils/constants/constants.dart';
import 'package:res_app/ui/widgets/res_text.dart';

class CityWidget extends StatelessWidget {
  final String _countryPlace;
  final String _namePlace;

  const CityWidget({
    Key? key,
    required String countryPlace,
    required String namePlace,
  })  : _countryPlace = countryPlace,
        _namePlace = namePlace,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(kDimens5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black45,
          ),
        ),
        child: const Icon(
          Icons.location_on_outlined,
          size: kDimens25,
        ),
      ),
      title: ResText(
        colorText: kBlack100,
        text: _namePlace,
        fontSize: kDimens12,
        fontWeight: FontWeight.bold,
      ),
      subtitle: ResText(
        colorText: kBlack100,
        text: _countryPlace,
        fontSize: kDimens12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
