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
  final String title;
  SearchCard({required this.onSearch,required this.title});


  @override
  Widget build(BuildContext context) {
    TextEditingController trackNumberController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                child: Theme(
                  data: ThemeData(
                    textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue[200]),
                  ),
                  child: TextField(
                    controller: trackNumberController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: title,
                      hintStyle: black18text,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: black16text,
                  ),
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
                    color: white,
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
