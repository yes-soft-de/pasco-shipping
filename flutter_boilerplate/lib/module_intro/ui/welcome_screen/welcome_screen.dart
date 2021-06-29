import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_auth/authorization_routes.dart';
import 'package:pasco_shipping/module_intro/widget/roundedButton.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

import '../../intro_routes.dart';

@injectable
class WelcomeScreen extends StatelessWidget {
  // const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(StaticImage.intro),
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: Text(
                          S.of(context).welcome,
                          style: titleBlackStyle,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                StaticImage.divider,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    RoundedButton(
                      radius: 20,
                        color: AppThemeDataService.AccentColor,
                        style: mainHeaderBlackStyle,
                        icon: StaticImage.person,
                        go: () {
                          Navigator.of(context).pushNamed(
                            AuthorizationRoutes.REGISTER_SCREEN,
                          );
                        },
                        lable: S.of(context).signUp),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    RoundedButton(
                      radius: 20,
                        color: AppThemeDataService.PrimaryDarker,
                        style: mainHeaderBlackStyle,
                        icon: StaticImage.personRegister,
                        go: () {
                          Navigator.of(context).pushNamed(
                            AuthorizationRoutes.LOGIN_SCREEN,
                          );
                        },
                        lable: S.of(context).signIn),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
