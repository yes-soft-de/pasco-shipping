import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

import '../../../module_shipment_previous/previous_routes.dart';
import '../../tracking_routes.dart';

class SearchCard extends StatelessWidget {
  final Function onSearch;
  SearchCard({required this.onSearch});


  @override
  Widget build(BuildContext context) {
    TextEditingController trackNumberController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: AppThemeDataService.AccentColor, width: 3.5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: trackNumberController,
                  decoration: InputDecoration(
                    hintText: S.of(context).enterShipmentNumber,
                    hintStyle: white18text,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: white18text,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppThemeDataService.AccentColor,
                  shape: CircleBorder(),
                ),
                onPressed: () {
                  if(trackNumberController.text.isEmpty) {
                    Fluttertoast.showToast(msg: S.of(context).required);
                  } else {
                    onSearch(trackNumberController.text);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.search_outlined,
                    color: black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
