import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_shipment_previous/ui/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

@injectable
class ProfileScreen extends StatelessWidget {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locController = TextEditingController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _cityController..text = 'damascus';
    _countryController..text = 'Syria';
    _phoneController..text = '+963-995861654';
    _locController
      ..text = 'Neque porro quisquam est qui dolorem ipsum quia dolor sit';
    return Background(
      controller: controller,
      isHome: false,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: white)),
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(StaticImage.profile),
              )),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 30, end: 30, top: 15),
            child: Card(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
              color: black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            cursorColor: AppThemeDataService.AccentColor,
                            controller: _countryController,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppThemeDataService.AccentColor)),
                                suffixIcon: Image.asset(StaticImage.city),
                                labelText: S.of(context).country,
                                labelStyle: white16text),
                            style: white16text,
                            textInputAction: TextInputAction.next,
                            // onEditingComplete: () => node.nextFocus(),
                            // Move focus to next
                            validator: (result) {
                              if (result == null) {
                                return S.of(context).required;
                              } else {
                                if (result.isEmpty) {
                                  return S.of(context).required;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            cursorColor: AppThemeDataService.AccentColor,
                            controller: _cityController,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppThemeDataService.AccentColor)),
                                suffixIcon: Image.asset(StaticImage.house),
                                labelText: S.of(context).city,
                                labelStyle: white16text),
                            style: white16text,
                            textInputAction: TextInputAction.next,
                            // onEditingComplete: () => node.nextFocus(),
                            // Move focus to next
                            validator: (result) {
                              if (result == null) {
                                return S.of(context).required;
                              } else {
                                if (result.isEmpty) {
                                  return S.of(context).required;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            cursorColor: AppThemeDataService.AccentColor,
                            controller: _phoneController,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.white)),
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: greyWhite,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppThemeDataService.AccentColor)),
                                labelText: S.of(context).phone,
                                labelStyle: white16text),
                            style: white16text,
                            textInputAction: TextInputAction.next,
                            // onEditingComplete: () => node.nextFocus(),
                            // Move focus to next
                            validator: (result) {
                              if (result == null) {
                                return S.of(context).required;
                              } else {
                                if (result.isEmpty) {
                                  return S.of(context).required;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(15)),
                      ),
                      color: greyBlack,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(StaticImage.location),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  S.of(context).location,
                                  style: white16text,
                                )
                              ],
                            ),
                          ),
                          TextEditLocation("Text...", 70)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: RoundedButton(
              radius: 15,
              lable: S.of(context).saveInfo,
              icon: StaticImage.edit,
              color: AppThemeDataService.AccentColor,
              go: () {},
              style: black18text,
            ),
          )
        ],
      ),
      title: S.of(context).profile,
      currentIndex: -1,
      isResultScreen: false,
    );
  }
}
