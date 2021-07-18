import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';
import 'package:pasco_shipping/utils/widget/text_edit.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';
import 'package:pasco_shipping/utils/widget/background.dart';

class ProfileSuccessfullyScreen extends StatefulWidget {
  final ProfileModel model;
  final Function updateProfile;
  const ProfileSuccessfullyScreen(
      {required this.model, required this.updateProfile});

  @override
  _ProfileSuccessfullyScreenState createState() =>
      _ProfileSuccessfullyScreenState();
}

class _ProfileSuccessfullyScreenState extends State<ProfileSuccessfullyScreen> {
  late final TextEditingController _countryController;
  late final TextEditingController _cityController;
  late final TextEditingController _phoneController;
  late final TextEditingController _locController;
  late final TextEditingController _userNameController;
  late ScrollController controller;

  late ProfileRequest _profileRequest;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController();
    _countryController..text = widget.model.country!;

    _cityController = TextEditingController();
    _cityController..text = widget.model.city!;

    _userNameController = TextEditingController();
    _userNameController..text = widget.model.userName!;

    _phoneController = TextEditingController();
    _phoneController..text = widget.model.phone!;

    _locController = TextEditingController();
    _locController..text = widget.model.location!;

    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: white)),
            margin: EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:Image.asset(StaticImage.profile),
            )),
        Text(widget.model.userName??'' , style: greyWhite14text,),
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
                                      color: AppThemeDataService.AccentColor)),
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
                                      color: AppThemeDataService.AccentColor)),
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
                                      color: AppThemeDataService.AccentColor)),
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
                        TextEditLocation(70,_locController)
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
            go: () {
              if(!validatorMakeChanges())
                {
                  Fluttertoast.showToast(msg: "you don't make any changes");
                }
              else{
                widget.updateProfile(_profileRequest);
              }
            },
            style: black18text,
          ),
        )
      ],
    );
  }

  bool validatorMakeChanges() {
    if (_cityController.text == widget.model.city &&
        _countryController.text == widget.model.country &&
        _phoneController.text == widget.model.phone &&
        _locController.text == widget.model.location &&
        _userNameController.text == widget.model.userName) {
      return false;
    } else {

      _profileRequest =
          ProfileRequest(userName: _userNameController.text, city: _cityController.text, country: _countryController.text, image: widget.model.image!, location: _locController.text, phone:_phoneController.text);
      print(json.encode(_profileRequest));
      return true;
    }
  }
}
