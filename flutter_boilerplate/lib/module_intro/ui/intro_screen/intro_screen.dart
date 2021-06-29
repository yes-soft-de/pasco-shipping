import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

import '../../intro_routes.dart';


@injectable
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(StaticImage.intro),
          fit: BoxFit.cover,
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(StaticImage.logo),
              SizedBox(height: 40,),
              Container(
                  width: 200,
                  child: Divider(color: AppThemeDataService.PrimaryColor,thickness: 2,)),
              Container(
                width: 250,
                child: RoundedButton(
                  radius: 12,
                    color: AppThemeDataService.PrimaryColor,
                    style: white24text,
                    icon: '',
                    go: () {
                      Navigator.of(context).pushNamed(
                        IntroRoutes.WELCOME_SCREEN,
                      );
                    },
                    lable: S.of(context).getStarted),
              ),
              Container(
                  width: 200,
                  child: Divider(color: AppThemeDataService.PrimaryColor,thickness: 2,)),
            ],
          ),
        ),
      ),
    );
  }
}
